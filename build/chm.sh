#!/usr/bin/env bash

# Translate hierarchical markdown path to flat html path
# for HTML Help Workshop.
# e.g.
# bash/expansion.md -> bash_expansion.html
md2html()
{
    local md="$1"

    html=${md/%.md/.html}
    html=${html//\//_}

    echo "$html"
}

# Generate a toc item in the hhc file.
hhc_item()
{
    local name="$1"
    local html="$2"
    local level="$3"
    local indent=$(printf "%*s\n" "$level" | tr " " "\t")

    echo "${indent}"'<LI> <OBJECT type="text/sitemap">'
    echo -e "${indent}"'\t<param name="Name" value="'"$name"'">'
    echo -e "${indent}"'\t<param name="Local" value="'"$html"'">'
    echo -e "${indent}"'\t</OBJECT>'
}

# Generate toc items for a dir in the hhc file.
hhc_dir()
{
    local path="$1"
    local level="$2"
    local root="$3"
    local indent=$(printf "%*s\n" "$level" | tr " " "\t")

    # files
    find "$path" -maxdepth 1 -type f -name '*.md' | while read f
    do
        name=$(basename "$f" ".md")
        html=$(md2html "${f#$root}")
        hhc_item "$name" "$html" $(($level))
    done

    # dirs
    find "$path" -maxdepth 1 -type d | while read d
    do
        if [ "$d" == "$path" ]; then
            continue
        fi
        name=$(basename "$d" ".md")
        # dir item in hhc points to its first child file
        f=$(find "$d" -maxdepth 1 -type f | head -n1)
        if [ -n "$f" ]; then
            html=$(md2html "${f#$root}")
        else
            html="$name"
        fi
        hhc_item "$name" "$html" $(($level))
        echo "${indent}<UL>"
        hhc_dir "$d" $(($level+1)) "$root"
        echo "${indent}"'</UL>'
    done
}

# Generate the hhp file.
get_hhp()
{
    local name="$1"
    local path="$2"
    local index="$3"

    echo '[OPTIONS]
Compatibility=1.1 or later
Compiled file='"$name"'.chm
Contents file='"$name"'.hhc
Default Window=main
Default topic='"$index"'
Display compile progress=Yes
Full-text search=Yes
Language=0x804 Chinese (Simplified, China)
Title='"$name"'

[WINDOWS]
main="'"$name"'","'"$name"'.hhc","'"$name"'.hhk","'"$index"'","'"$index"'",,,,,0x62520,,0x10387e,,0x1000000,,,,,,0

[FILES]'
    echo "$index"

    find "$path" -type f -name '*.md' -printf "%P\n" | while read f
    do
        md2html "$f"
    done

    echo
    echo '[INFOTYPES]'
}

# Generate the hhc file.
get_hhc()
{
    local name="$1"
    local path="$2"
    local index="$3"
    local root="$path"

    if [ "${root: -1:1}" != '/' ]; then
        root="${root}/"
    fi

    echo '<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">
<HTML>
<HEAD>
<meta name="GENERATOR" content="Microsoft&reg; HTML Help Workshop 4.1">
<!-- Sitemap 1.0 -->
</HEAD><BODY>
<UL>'

    hhc_item $(basename "$index" ".html") "$index" 1
    hhc_dir "$path" 1 "$root"

    echo '</UL></BODY></HTML>'
}

# Generate the hhk file.
get_hhk()
{
    local name="$1"
    local path="$2"

echo '<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">
<HTML>
<HEAD>
<meta name="GENERATOR" content="Microsoft&reg; HTML Help Workshop 4.1">
<!-- Sitemap 1.0 -->
</HEAD><BODY>
<OBJECT type="text/site properties">
	<param name="FrameName" value="right">
</OBJECT>
<UL>
</UL>
</BODY></HTML>'
}

name="$1"
path="$2"
index="$3"
dst="$4"

# ./chm.sh cheatsheet ../src README.html
get_hhp "$name" "$path" "$index" >"$dst/$name".hhp
get_hhc "$name" "$path" "$index" >"$dst/$name".hhc
get_hhk "$name" "$path" >"$dst/$name".hhk
