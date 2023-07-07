\c spl;
-- ### TABLES CREATION #########################################################
DROP TABLE IF EXISTS reuniao_comissao;

CREATE TABLE IF NOT EXISTS reuniao_comissao(
  rec_id INT PRIMARY KEY,
  con_id INT NOT NULL, 
  rec_tipo_reuniao character varying NOT NULL, 
  rec_numero character varying NOT NULL, 
  versao INT NOT NULL, 
  rec_data DATE NOT NULL,
  rec_notificada boolean NOT NULL DEFAULT false
);

-- -----------------------------------------------------------------------------
DROP TABLE IF EXISTS pauta_comissao;

CREATE TABLE IF NOT EXISTS pauta_comissao(
  pac_id INT PRIMARY KEY,
  rec_id INT NOT NULL,
  pac_notificada boolean NOT NULL DEFAULT false, 
  pac_liberada boolean NOT NULL DEFAULT false, 
  versao INT NOT NULL DEFAULT 0,
  pac_texto TEXT
);

-- -----------------------------------------------------------------------------
DROP TABLE IF EXISTS conjunto_vereadores;

CREATE TABLE IF NOT EXISTS conjunto_vereadores(
  con_id INT PRIMARY KEY, 
  con_sigla character varying NOT NULL, 
  con_maximo INT NOT NULL, 
  ut_id INT NOT NULL, 
  ini_nome text NOT NULL, 
  ini_ativa boolean NOT NULL DEFAULT true, 
  tin_id INT NOT NULL, 
  versao INT NOT NULL, 
  ini_codigo_prefeitura INT NOT NULL, 
  con_descricao text NOT NULL, 
  con_site_ordem INT NOT NULL, 
  con_email character varying NOT NULL
);

-- -----------------------------------------------------------------------------
DROP TABLE IF EXISTS pauta_parecer;

CREATE TABLE IF NOT EXISTS pauta_parecer(
  par_id INT NOT NULL, 
  pac_id INT NOT NULL,

  CONSTRAINT PRIMARY KEY (pac_id, par_id)
);

-- -----------------------------------------------------------------------------
DROP TABLE IF EXISTS vereador;

CREATE TABLE IF NOT EXISTS vereador(
  ver_id INT PRIMARY KEY, 
  ver_sexo CHARACTER(1) NOT NULL, 
  ut_id integer,
  ini_nome character varying(100) not null,
  ini_ativa boolean not null default true,
  ver_nome_completo character varying(100) not null,
  versao integer not null default 0,
  ini_codigo_prefeitura integer,
  ver_site character varying(250),
  ver_biografia text,
  ver_redes_sociais character varying(250),
  ver_fone_principal character varying(20),
  ver_fones character varying(100),
  ver_legislaturas character varying(100),
  ver_localizacao character varying(50),
  ver_partido character varying(100),
  arq_id integer,
  arq_id_biografia integer
);

-- -----------------------------------------------------------------------------
DROP TABLE IF EXISTS proposicao;

CREATE TABLE IF NOT EXISTS proposicao(
  pro_id integer PRIMARY KEY,
  tpr_id integer not null,
  pro_numero integer,
  pro_ano integer,
  ini_id integer,
  usu_id integer,
  pro_envio_protocolo timestamp without time zone,
  pro_protocolada timestamp without time zone,
  ut_id integer,
  pro_texto text,
  pro_sumula text,
  pro_justificativa text,
  pro_observacao text,
  pro_id_anexada_por integer,
  nod_id integer,
  pro_alternativo boolean not null default false,
  pro_devolvida boolean default false,
  est_id integer not null,
  pro_informado156 boolean not null default false,
  pro_resposta_pmc text,
  pro_introducao text,
  pro_assinatura text,
  pro_id_alvo integer,
  pro_mensagem character varying(20),
  pro_ultimo_tramite timestamp without time zone,
  raz_id integer,
  pro_sumula_red_final text,
  pro_sumula_seg_turno text,
  pro_texto_red_final text,
  pro_texto_seg_turno text,
  versao integer not null default 0,
  pro_finalizada boolean not null default false,
  pro_pesquisa_textual tsvector,
  pro_veto character varying not null default 'Nenhum',
  pro_cancelando_tramite boolean not null default false,
  pro_consultas integer not null default 0,
  pro_consultas_anteriores integer not null default 0,
  pro_similar_antiga text,
  pro_informacao_quota text,
  pro_data_veto_total date,
  usu_id_final integer,
  pro_data_final timestamp without time zone,
  pro_exercicio integer,
  pro_id_origem integer,
  pro_codigo_envio character varying(8),
  pro_justificativa_prorrogacao text,
  pro_pedido_presencial boolean not null default false,
  pro_pedido_recorrido character varying(14),
  pro_codigo character varying(23),
  clo_id integer,
  eld_id integer,
  pro_valor_orcamento numeric(12,2),
  org_id integer,
  uno_id integer,
  pro_autografo2_ementa text,
  pro_autografo2_liberado boolean default false,
  pro_autografo2_texto text,
  pro_autografo_ementa text,
  pro_autografo_liberado boolean default false,
  pro_autografo_texto text,
  pro_promulgacao_texto text,
  pro_promulgacao_ementa text,
  pro_promulgacao_liberada boolean default false,
  pro_promulgacao_norma character varying(12),
  pro_solicita_urgencia boolean,
  pro_urgencia character varying not null default 'Nenhuma',
  pro_meta_fisica character varying(12),
  eo_id integer,
  ut_id_criacao integer,
  pro_sumula_plain text,
  pro_link_relativo text,
  ver_id_ingressando integer,
  pro_sancao character varying,
  pro_sigilo character varying default 'Nenhum',
  pro_defesa_previa date,
  pro_alegacoes_finais date
);

-- -----------------------------------------------------------------------------
DROP TABLE IF EXISTS iniciativa;

CREATE TABLE IF NOT EXISTS iniciativa(
  ini_id integer not null PRIMARY KEY,
  tin_id integer not null,
  ini_nome text,
  ini_ativa boolean not null DEFAULT true,
  versao integer not null DEFAULT 0,
  ini_codigo_prefeitura integer
);

-- -----------------------------------------------------------------------------
DROP TABLE IF EXISTS texto_vereador;

CREATE TABLE IF NOT EXISTS texto_vereador(
  par_id integer not null,
  txt_data date not null,
  txt_finalizado boolean not null DEFAULT false,
  txt_id integer not null PRIMARY KEY,
  txt_relator boolean not null,
  txt_texto text,
  ver_id integer,
  versao integer not null DEFAULT 0,
  txt_feito_no_gab boolean not null DEFAULT true,
  txt_adotado boolean not null DEFAULT false,
  tcp_id integer,
  txt_com_emenda boolean
);

-- -----------------------------------------------------------------------------
DROP TABLE IF EXISTS tipo_conclusao_parecer;

CREATE TABLE IF NOT EXISTS tipo_conclusao_parecer(
  tcp_id integer not null PRIMARY KEY,
  tcp_nome character varying(40) not null,
  versao integer not null DEFAULT 0,
);

-- -----------------------------------------------------------------------------
DROP TABLE IF EXISTS tramite;

CREATE TABLE IF NOT EXISTS tramite(
  tra_id integer not null PRIMARY KEY,
  pro_id integer not null,
  tra_data_envio timestamp without time zone  not null,
  usu_id integer not null,
  ut_id_origem integer not null,
  ut_id_destino integer not null,
  raz_id integer not null,
  ttr_id integer not null,
  tra_observacao text,
  versao integer not null DEFAULT 0,
  tra_cancelamento integer not null DEFAULT 0,
  est_id_destino integer,
  est_id_origem integer,
  nod_id_destino integer,
  nod_id_origem integer,
  tra_data_recebimento timestamp without time zone,
  usu_id_receptor integer
);

-- -----------------------------------------------------------------------------
DROP TABLE IF EXISTS prazo;

CREATE TABLE IF NOT EXISTS prazo(
  prz_id integer  not null PRIMARY KEY,
  prz_inicio date not null,
  prz_fim date,
  tpz_id integer,
  pro_id integer,
  versao integer not null DEFAULT 0,
  prz_descricao text,
  ut_id integer,
  prz_prorrogacoes integer
);

-- -----------------------------------------------------------------------------
DROP TABLE IF EXISTS parecer;

CREATE TABLE IF NOT EXISTS parecer(
  par_id integer not null PRIMARY KEY,
  par_ano integer,
  par_data date,
  par_finalizado boolean not null DEFAULT false,
  par_numero integer,
  par_observacao text,
  par_texto text,
  par_vencido boolean,
  con_id integer,
  par_veto boolean,
  pro_id integer not null,
  ver_id integer,
  versao integer not null DEFAULT 0,
  tcp_id integer,
  pro_id_anexada_por integer,
  par_criacao timestamp without time zone
);
-- -----------------------------------------------------------------------------
-- DROP TABLE IF EXISTS proposicoes_pauta_reuniao;

-- CREATE TABLE IF NOT EXISTS proposicoes_pauta_reuniao(
--   pac_id INT NOT NULL, 
--   par_id INT NOT NULL, 
--   codigo_proposicao character varying NOT NULL, 
--   iniciativa text NOT NULL, 
--   sumula character varying NOT NULL, 
--   relator character varying NOT NULL, 
--   conclusao_relator character varying NOT NULL, 
--   conclusao_comissao character varying NOT NULL, 
--   tem_emendas boolean,
--   PRIMARY KEY (pac_id, par_id, codigo_proposicao)
-- );

-- -----------------------------------------------------------------------------
-- DROP TABLE IF EXISTS texto_conclusao_autor;

-- CREATE TABLE IF NOT EXISTS texto_conclusao_autor(
--   txt_id INT PRIMARY KEY,	
--   pro_id INT NOT NULL, 
--   pro_codigo character varying, 
--   par_id INT,	
--   txt_data date, 
--   txt_finalizado boolean, 
--   txt_relator boolean,	
--   ver_id INT,	
--   vereador character varying, 
--   tcp_id INT, 
--   tcp_nome character varying, 
--   par_finalizado boolean, 
--   con_id INT
-- );