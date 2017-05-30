
declare namespace functx = "http://www.functx.com";
declare function functx:trim
  ( $arg as xs:string? )  as xs:string {

   replace(replace($arg,'\s+$',''),'^\s+','')
 } ;

for $x in doc("/home/over/workspace/xquery/src/xquery/data.xml")/orm/mapeamento/tabela[@nome="PESSOA"]/colunas/coluna[@chave_primaria = true()]
return <resultado>{functx:trim(data($x[@nome_col]))}</resultado>