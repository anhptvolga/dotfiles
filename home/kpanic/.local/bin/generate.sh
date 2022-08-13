name=generate
usage()
{
  echo "Usage: "$name" [ -d | --diff]
                        [ -v | --version postgres version]
                        [ -i | --input INPUT_FILE]
                        [ -o | --output OUTPUT_FILE ]
       "
  exit 2
}
PARSED_ARGUMENTS=$(getopt -a -n $name -o di:o: --long diff,input:,output: -- "$@")
VALID_ARGUMENTS=$?
if [ "$VALID_ARGUMENTS" != "0" ]; then
  usage
fi
echo $PARSED_ARGUMENTS
eval set -- "$PARSED_ARGUMENTS"
PG_VERSION=13.0
while :
do
  case "$1" in
    -d | --diff)     DIFF=1; shift;;
    -i | --input)    INPUT_FILE="$2"; shift 2;;
    -o | --output)   OUTPUT_FILE="$2"; shift 2;;
    -v | --version)   PG_VERSION="$2"; shift 2;;
    --) shift; break ;;
    *) echo "Unexpected option: |$1| - this should not happen."
       usage ;;
  esac
done

echo $DIFF
echo $INPUT_FILE
echo $OUTPUT_FILE
echo $PG_VERSION

old_design='/tmp/old-db'
fixed_old_design='/tmp/fixed-old-db'
old_sql='/tmp/old-sql'
tmp_db='tmpdb'

git show develop:$INPUT_FILE > $old_design
pgmodeler-cli --fix-model -if $old_design -of $fixed_old_design
pgmodeler-cli -v $PG_VERSION --export-to-file -if $fixed_old_design -of $old_sql
psql postgres postgres -c 'drop database if exists '$tmp_db' with (force);'
psql postgres postgres -c 'create database '$tmp_db';'
psql $tmp_db postgres -f $old_sql
pgmodeler-cli -v $PG_VERSION -df -dm -if $INPUT_FILE -ca local-db -ct $tmp_db --save -of $OUTPUT_FILE

