for $x in doc("/home/over/workspace/xquery/src/xquery/data.xml")/orm/mapeamento/tabela[@nome="PESSOA"]/relacionamentos/relacionamento/par/para
return <resultado>{data($x)}</resultado>