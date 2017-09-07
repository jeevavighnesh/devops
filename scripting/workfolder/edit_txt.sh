old="$(sed '3q;d' txt.txt)"
new="h@H.com"
sed -i.bak "3 s/$old/$new/" txt.txt
