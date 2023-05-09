create database exercicio_licensas;
use exercicio_licensas;


select COUNT(*) from lcliente;

SELECT * FROM llicenca where month(DtAquisicao) = 10;

SELECT * FROM llicenca where year(DtAquisicao) = 2007 AND month(DtAquisicao) = 05;

SELECT idTIPO_Empresa, descricaoTipo, SUBSTR(descricaoTipo, 1, 5) FROM ltipo_empresa ORDER BY descricaoTipo asc;

SELECT idTIPO_Empresa, descricaoTipo, SUBSTR(descricaoTipo, -5, 5) FROM ltipo_empresa ORDER BY descricaoTipo desc;

SELECT idTIPO_Empresa, descricaoTipo, SUBSTR(descricaoTipo, 6, 5) FROM ltipo_empresa ORDER BY idTIPO_Empresa ASC;

SELECT Nome_RazaoSocial, length(Nome_RazaoSocial) FROM lcliente ORDER BY Nome_RazaoSocial ASC, Nome_RazaoSocial;

SELECT Nome_RazaoSocial, length(Nome_RazaoSocial) FROM lcliente ORDER BY Nome_RazaoSocial ASC, Nome_RazaoSocial;

SELECT NumLicenca, DtAquisicao, datediff(curdate(), DtAquisicao) FROM llicenca; 

SELECT lcase(NomeSetor), ucase(NomeSetor) FROM lsetor;

SELECT
    S.NomeSoftware,
    V.Versao
FROM
    lsoftware S
INNER JOIN
  lversao V
ORDER BY
    S.NomeSoftware,
    V.Versao ASC;
  
SELECT C.Nome_RazaoSocial,
T.DescricaoTipo,
S.NomeSetor
FROM lcliente as C
INNER JOIN ltipo_empresa as T
ON C.idTIPO_Empresa_FK = T.idTIPO_Empresa
INNER JOIN lsetor as S
ON C.idSETOR_FK = S.idSETOR
ORDER BY T.DescricaoTipo, S.NomeSetor ASC;

SELECT
    C.idCLIENTE,
    C.Nome_RazaoSocial,
    L.NumLicenca,
    L.DtAquisicao,
    L.ValorAquisicao
FROM
    lCliente C
INNER JOIN
    llicenca L;
    
SELECT
    C.Nome_RazaoSocial,
    S.NomeSoftware
FROM
    lCliente C
INNER JOIN
    lsoftware S
GROUP BY
C.Nome_RazaoSocial, S.NomeSoftware
ORDER BY
C.Nome_RazaoSocial, S.NomeSoftware ASC;


SELECT C.Nome_RazaoSocial,
T.DescricaoTipo,
S.NomeSetor
FROM lcliente as C
INNER JOIN ltipo_empresa as T
ON C.idTIPO_Empresa_FK = T.idTIPO_Empresa
INNER JOIN lsetor as S
ON C.idSETOR_FK = S.idSETOR
WHERE C.UF IN ('SP' 'RS', 'PR', 'MG');

SELECT
  SW.NomeSoftware,
  V.Versao,
  C.idCLIENTE,
  C.Nome_RazaoSocial,
  T.DescricaoTipo,
  S.NomeSetor,
  L.NumLicenca,
  L.DtAquisicao,
  L.ValorAquisicao
FROM lcliente as C
INNER JOIN ltipo_empresa as T
ON C.idTIPO_Empresa_FK = T.idTIPO_Empresa
INNER JOIN lsetor as S
ON C.idSETOR_FK = S.idSETOR
INNER JOIN llicenca as L
INNER JOIN lsoftware as SW
ON L.idSOFTWARE_FK_FK = SW.idSOFTWARE
INNER JOIN lversao as V
ON L.Versao_FK = V.Versao
ORDER BY
SW.NomeSoftware,
V.Versao, L.DtAquisicao,
C.idCLIENTE;


SELECT COUNT(*) AS Licencas_vendidas FROM llicenca;

SELECT sum(ValorAquisicao) as Soma, AVG(ValorAquisicao) as Media, MAX(ValorAquisicao) as MaiorValor, MIN(ValorAquisicao) as MenorValor FROM llicenca;

SELECT count(S.NomeSetor)
FROM lcliente as C
INNER JOIN lsetor as S
ON C.idSETOR_FK = S.idSETOR
WHERE S.NomeSetor = 'Farmautica';



select count(*) from lsetor;
select * from lcliente;


SELECT C.Nome_RazaoSocial, count(L.NumLicenca)
FROM llicenca as L
INNER JOIN lcliente as C
ON L.idCliente_FK = C.idCLIENTE
group by C.Nome_RazaoSocial;

SELECT C.Nome_RazaoSocial, sum(L.ValorAquisicao) as total, avg(L.ValorAquisicao) as media
FROM llicenca as L
INNER JOIN lcliente as C
ON L.idCliente_FK = C.idCLIENTE
group by C.Nome_RazaoSocial;

SELECT S.NomeSetor, sum(L.ValorAquisicao) as total
FROM llicenca as L
INNER JOIN lcliente as C
ON L.idCliente_FK = C.idCLIENTE
INNER JOIN lsetor as S
ON C.idSetor_FK = S.idSETOR
group by S.NomeSetor;

SELECT T.DescricaoTipo, sum(L.ValorAquisicao) as total
FROM llicenca as L
INNER JOIN lcliente as C
ON L.idCliente_FK = C.idCLIENTE
INNER JOIN ltipo_empresa as T
ON C.idTIPO_Empresa_FK = T.idTIPO_Empresa
group by T.DescricaoTipo;

SELECT S.NomeSoftware, V.Versao, sum(L.ValorAquisicao) as total
FROM llicenca as L
INNER JOIN lversao as V
ON L.Versao_FK = V.Versao
INNER JOIN lsoftware as S
ON V.idSoftware_FK = S.idSOFTWARE
group by S.NomeSoftware, V.Versao;


SELECT S.NomeSoftware, C.Nome_RazaoSocial, count(L.NumLicenca) as total
FROM llicenca as L
INNER JOIN lcliente as C
ON L.idCliente_FK = C.idCLIENTE
INNER JOIN lversao as V
ON L.Versao_FK = V.Versao
INNER JOIN lsoftware as S
ON V.idSoftware_FK = S.idSOFTWARE
group by S.NomeSoftware, C.Nome_RazaoSocial;

SELECT C.Nome_RazaoSocial, count(L.NumLicenca) as total
FROM llicenca as L
INNER JOIN lcliente as C
ON L.idCliente_FK = C.idCLIENTE
INNER JOIN lversao as V
ON L.Versao_FK = V.Versao
group by C.Nome_RazaoSocial;

SELECT C.Nome_RazaoSocial, count(L.NumLicenca) as total
FROM llicenca as L
INNER JOIN lcliente as C
ON L.idCliente_FK = C.idCLIENTE
group by C.Nome_RazaoSocial having count(*) >= 10;

