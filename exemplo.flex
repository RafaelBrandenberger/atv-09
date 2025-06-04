/* Definição: seção para código do usuário. */

/* definicao: secao para codigo do usuario. */
import java_cup.runtime.Symbol;

%%
/* opcoes e declaracoes: secao para diretivas e macros. */
%cup
%unicode
%line
%column
%class AnalisadorLexico

// macros:
digito = [0-9]
inteiro = {digito}+

%%

/* regras e acoes associadas: secao de instrucoes para o analisador lexico. */

{inteiro} {
            Integer numero = Integer.valueOf(yytext());
            return new Symbol(sym.INTEIRO, yyline, yycolumn, numero);
          }
"+"       { return new Symbol(sym.MAIS); }
"-"       { return new Symbol(sym.MENOS); }
"*"       { return new Symbol(sym.MULT); }      // adicionado suporte para multiplicacao
"/"       { return new Symbol(sym.DIV); }       // adicionado suporte para divisao
"%"       { return new Symbol(sym.RESTO); }     // adicionado suporte para resto da divisao
"^"       { return new Symbol(sym.POT); }       // adicionado suporte para potenciacao
"("       { return new Symbol(sym.PARENTESQ); }
")"       { return new Symbol(sym.PARENTDIR); }
";"       { return new Symbol(sym.PTVIRG); }
\n        { /* Ignora nova linha. */ }
[ \t\r]+  { /* Ignora espacos. */ }
.         { System.err.println("\n caractere invalido: " + yytext() +
                               "\n linha: " + yyline +
                               "\n coluna: " + yycolumn + "\n"); 
            return null; 
          }