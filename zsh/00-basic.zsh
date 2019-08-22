# When on my personal laptop, I do not need the hostname in the prompt
HOSTNAME_REGEX="^(bagrat13|Bagrat-Aznauryan-.*).*$"
if [[ "`hostname`" =~ $HOSTNAME_REGEX ]]
then
    export HELLO_ITS_ME=1
else
    export HELLO_ITS_ME=0
fi

# Provide a way to turn off patched font symbols
if [[ "$USE_SYMBOLS" != "0" ]]
then
    export USE_SYMBOLS=1
fi

function color_pallete {
    for code in $(seq -f "%01g" 0 15);
    do
        echo -n -e "\x1B[38;05;${code}m [  $code: Test  ] ";
    done
    echo
}
