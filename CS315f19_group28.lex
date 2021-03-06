%{
    int lineCount = 1;
    #include <stdio.h>
    #include "y.tab.h"
    void yyerror(char *);
%}

newLine [\n]

start START
finish FINISH

double_value [0-9]+\.[0-9]+
string_text \"[A-Za-z\!\‘\^\#\+\$\%\&\/\{\(\[\)\]\=\?\*\\\-\“\|\:\.\, ]*\"
comment_text \#[A-Za-z\!\‘\^\#\+\$\%\&\/\{\(\[\)\]\=\?\*\\\-\“\|\:\.\, ]*\#
integer [0-9]+
identifier [a-z][a-z_0-9]*

plus \+
minus \-
multiply \*
divide \/
pow \^
comma \,
and \&\&
or \|\|

if if
else else
for for
in in
where where
with with
while while

func func
call call
return_stmt return
read_temp read_temp
read_humidity read_humidity
read_air_pressure read_air_pressure
read_air_quality read_air_quality
read_light read_light
read_sound_level read_sound_level
read_timer read_timer
send_int send_int
read_int read_int
connect connect
scan scan
print print

switchon1 SwitchON1
switchon2 SwitchON2
switchon3 SwitchON3
switchon4 SwitchON4
switchon5 SwitchON5
switchon6 SwitchON6
switchon7 SwitchON7
switchon8 SwitchON8
switchon9 SwitchON9
switchon10 SwitchON10

switchoff1 SwitchOFF1
switchoff2 SwitchOFF2
switchoff3 SwitchOFF3
switchoff4 SwitchOFF4
switchoff5 SwitchOFF5
switchoff6 SwitchOFF6
switchoff7 SwitchOFF7
switchoff8 SwitchOFF8
switchoff9 SwitchOFF9
switchoff10 SwitchOFF10

string string
array array
int int
double double
connection connection

lp \(
rp \)
lsb \[
rsb \]

block_start \/\/
block_finish \\\\

less \<
greater \>
less_eq (<=)
greater_eq (>=)
equal \=
equal_comp \=\=

%%

{start} return(START);
{finish} return(FINISH);

{block_start} return(BLOCK_START);
{block_finish} return(BLOCK_FINISH);


{if} return(IF);
{else} return(ELSE);
{for} return(FOR);
{in} return(IN);
{where} return(WHERE);
{with} return(WITH);
{while} return(WHILE);


{func} return(FUNC);
{call} return(CALL);
{return_stmt} return(RETURN);
{read_temp} return(READ_TEMP);
{read_humidity} return(READ_HUMIDITY);
{read_air_pressure} return(READ_AIR_PRESSURE);
{read_air_quality} return(READ_AIR_QUALITY);
{read_light} return(READ_LIGHT);
{read_sound_level} return(READ_SOUND_LEVEL);
{read_timer} return(READ_TIMER);
{send_int} return(SEND_INT);
{read_int} return(READ_INT);
{connect} return(CONNECT);
{scan} return(SCAN);
{print} return(PRINT);

{switchon1} return(SWITCH_ON_1);
{switchon2} return(SWITCH_ON_2);
{switchon3} return(SWITCH_ON_3);
{switchon4} return(SWITCH_ON_4);
{switchon5} return(SWITCH_ON_5);
{switchon6} return(SWITCH_ON_6);
{switchon7} return(SWITCH_ON_7);
{switchon8} return(SWITCH_ON_8);
{switchon9} return(SWITCH_ON_9);
{switchon10} return(SWITCH_ON_10);

{switchoff1} return(SWITCH_OFF_1);
{switchoff2} return(SWITCH_OFF_2);
{switchoff3} return(SWITCH_OFF_3);
{switchoff4} return(SWITCH_OFF_4);
{switchoff5} return(SWITCH_OFF_5);
{switchoff6} return(SWITCH_OFF_6);
{switchoff7} return(SWITCH_OFF_7);
{switchoff8} return(SWITCH_OFF_8);
{switchoff9} return(SWITCH_OFF_9);
{switchoff10} return(SWITCH_OFF_10);

{integer} return(INTEGER);
{double_value} return(DOUBLE_VALUE);
{string_text} return(STRING_TEXT);
{comment_text} return(COMMENT_TEXT);

{array} return(ARRAY);
{int} return(INT);
{string} return(STRING);
{double} return(DOUBLE);
{connection} return(CONNECTION);

{lp} return(LP);
{rp} return(RP);
{lsb} return(LSB);
{rsb} return(RSB);
{plus} return(PLUS);
{minus} return(MINUS);
{multiply} return(MULTIPLY);
{divide} return(DIVIDE);
{pow} return(POW);
{comma} return(COMMA);
{and} return(AND);
{or} return(OR);

{identifier} return(IDENTIFIER);

{less} return(LESS);
{greater} return(GREATER);
{less_eq} return(LESS_EQ);
{greater_eq} return(GREATER_EQ);
{equal} return(EQ);
{equal_comp} return(EQ_COMP);
[ \r\t] ;

{newLine} {lineCount++;}

%%

int yywrap( void ) { return 1; }
