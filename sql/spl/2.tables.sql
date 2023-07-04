\c spl;
-- ### TABLES CRIATION #########################################################
DROP TABLE IF EXISTS reuniao_comissao;

CREATE TABLE IF NOT EXISTS reuniao_comissao(
  rec_id INT PRIMARY KEY,
  con_id INT NOT NULL, 
  rec_tipo_reuniao character varying NOT NULL, 
  rec_numero character varying NOT NULL, 
  versao INT NOT NULL, 
  rec_data DATE NOT NULL
);

-- -----------------------------------------------------------------------------
DROP TABLE IF EXISTS pauta_comissao;

CREATE TABLE IF NOT EXISTS pauta_comissao(
  pac_id INT PRIMARY KEY,
  rec_id INT NOT NULL,
  pac_notificada boolean NOT NULL, 
  pac_liberada boolean NOT NULL, 
  versao INT NOT NULL
);

-- -----------------------------------------------------------------------------
DROP TABLE IF EXISTS conjunto_vereadores;

CREATE TABLE IF NOT EXISTS conjunto_vereadores(
  con_id INT PRIMARY KEY, 
  con_sigla character varying NOT NULL, 
  con_maximo INT NOT NULL, 
  ut_id INT NOT NULL, 
  ini_nome text NOT NULL, 
  ini_ativa boolean NOT NULL, 
  tin_id INT NOT NULL, 
  versao INT NOT NULL, 
  ini_codigo_prefeitura INT NOT NULL, 
  con_descricao text NOT NULL, 
  con_site_ordem INT NOT NULL, 
  con_email character varying NOT NULL
);

-- -----------------------------------------------------------------------------
DROP TABLE IF EXISTS proposicoes_pauta_reuniao;

CREATE TABLE IF NOT EXISTS proposicoes_pauta_reuniao(
  pac_id INT NOT NULL, 
  par_id INT NOT NULL, 
  codigo_proposicao character varying NOT NULL, 
  iniciativa text NOT NULL, 
  sumula character varying NOT NULL, 
  relator character varying NOT NULL, 
  conclusao_relator character varying NOT NULL, 
  conclusao_comissao character varying NOT NULL, 
  tem_emendas boolean,
  PRIMARY KEY (pac_id, par_id, codigo_proposicao)
);

-- -----------------------------------------------------------------------------
DROP TABLE IF EXISTS texto_conclusao_autor;

CREATE TABLE IF NOT EXISTS texto_conclusao_autor(
  pro_id INT NOT NULL, 
  pro_codigo character varying, 
  par_id INT,	
  txt_data date, 
  txt_finalizado boolean, 
  txt_relator boolean,	
  txt_id INT,	
  ver_id INT,	
  vereador character varying, 
  tcp_id INT, 
  tcp_nome character varying, 
  par_finalizado boolean, 
  con_id INT
);