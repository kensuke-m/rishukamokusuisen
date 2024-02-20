#!/bin/sh

orig=/Users/miyasita/work/iot/iots2023/rishudata2018-2022.csv

# 必修科目（仏教学，ゼミ，卒論など）とアプローチ科目，語学を削除して，単位修得した科目だけを残し，履修年度を削除して sort し，重複を除いた後，履修科目を学生ごとに1行にまとめる

grep -v -e '仏教学' -e '英語IA' -e '英語IB' -e '情報リテラシー基礎' -e '運動と健康科学' -e 'キャリア開発I,' -e 'ジェンダーと現代社会' -e '現代社会入門' -e ',基礎演習I' -e ',演習[IV]' -e '卒業論文' -e 'アプローチ' -e '中国語' -e 'コリア語' -e '英語' -e 'フランス語' -e 'ドイツ語' $orig |\
awk -F, '$3>=60{ print $2","$4 }' |\
sort | uniq |\
awk -F, '{
    kamoku[$2] = kamoku[$2]","$1;
}
END {
    for (s in kamoku) {
        print kamoku[s]
    }
}' |\
sed -e 's/^,//' > rishudata2018-2022.csv
