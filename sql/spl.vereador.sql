                                                                                                          Table "spl.vereador"
        Column         |          Type          | Collation | Nullable |                    Default                     | Storage  | Compression | Stats target |                              Description                               
-----------------------+------------------------+-----------+----------+------------------------------------------------+----------+-------------+--------------+------------------------------------------------------------------------
 ver_id                | integer                |           | not null | nextval('spl.iniciativa_ini_id_seq'::regclass) | plain    |             |              | 
 ver_sexo              | character(1)           |           | not null |                                                | extended |             |              | 
 ut_id                 | integer                |           |          |                                                | plain    |             |              | 
 ini_nome              | character varying(100) |           | not null |                                                | extended |             |              | 
 ini_ativa             | boolean                |           | not null | true                                           | plain    |             |              | 
 ver_nome_completo     | character varying(100) |           | not null |                                                | extended |             |              | Nome completo do vereador (não o nome político)
 versao                | integer                |           | not null | 0                                              | plain    |             |              | Nº de versão, para lock otimista
 ini_codigo_prefeitura | integer                |           |          |                                                | plain    |             |              | Código da iniciativa para o sistema 156
 ver_site              | character varying(250) |           |          |                                                | extended |             |              | Site do vereador.
 ver_biografia         | text                   |           |          |                                                | extended |             |              | Biografia do vereador.
 ver_redes_sociais     | character varying(250) |           |          |                                                | extended |             |              | 
 ver_fone_principal    | character varying(20)  |           |          |                                                | extended |             |              | Fone que será divulgado no site, próximo à foto do vereador.
 ver_fones             | character varying(100) |           |          |                                                | extended |             |              | Outros fones do gabinete do vereador.
 ver_legislaturas      | character varying(100) |           |          |                                                | extended |             |              | 
 ver_localizacao       | character varying(50)  |           |          |                                                | extended |             |              | Localização física do gabinete do vereador.
 ver_partido           | character varying(100) |           |          |                                                | extended |             |              | Sigla do partido do vereador.
 arq_id                | integer                |           |          |                                                | plain    |             |              | Indica a foto principal do vereador na tabela arquivo (foto de rosto).
 arq_id_biografia      | integer                |           |          |                                                | plain    |             |              | Indica a foto da biografia do vereador na tabela arquivo.
Indexes:
    "pkvereador" PRIMARY KEY, btree (ver_id), tablespace "index"
Foreign-key constraints:
    "fk_vereador_arquivo" FOREIGN KEY (arq_id) REFERENCES spl.arquivo(arq_id)
    "fk_vereador_arquivo_biografia" FOREIGN KEY (arq_id_biografia) REFERENCES spl.arquivo(arq_id)
    "fk_vereador_unidade_tramitacao" FOREIGN KEY (ut_id) REFERENCES spl.unidade_tramitacao(ut_id) ON DELETE CASCADE
Referenced by:
    TABLE "spl.assinatura" CONSTRAINT "assinatura_ver_id_fkey" FOREIGN KEY (ver_id) REFERENCES spl.vereador(ver_id)
    TABLE "spl.apoio" CONSTRAINT "fk_apoio_vereador" FOREIGN KEY (ver_id) REFERENCES spl.vereador(ver_id)
    TABLE "spl.arquivo" CONSTRAINT "fk_arquivo_vereador" FOREIGN KEY (ver_id) REFERENCES spl.vereador(ver_id) ON DELETE CASCADE
    TABLE "spl.ata_comissao_vereador" CONSTRAINT "fk_ata_comissao_vereador_vereador" FOREIGN KEY (ver_id) REFERENCES spl.vereador(ver_id)
    TABLE "spl.composicao" CONSTRAINT "fk_composicao_vereador" FOREIGN KEY (ver_id) REFERENCES spl.vereador(ver_id) ON DELETE RESTRICT
    TABLE "spl.emenda_valor" CONSTRAINT "fk_emenda_valor_vereador" FOREIGN KEY (ver_id) REFERENCES spl.vereador(ver_id)
    TABLE "spl.hcomposicao" CONSTRAINT "fk_hcomposicao_vereador" FOREIGN KEY (ver_id) REFERENCES spl.vereador(ver_id)
    TABLE "spl.parecer" CONSTRAINT "fk_parecer_vereador" FOREIGN KEY (ver_id) REFERENCES spl.vereador(ver_id)
    TABLE "spl.presenca" CONSTRAINT "fk_presenca_vereador" FOREIGN KEY (ver_id) REFERENCES spl.vereador(ver_id)
    TABLE "spl.proposicao" CONSTRAINT "fk_proposicao_vereador_ingressando" FOREIGN KEY (ver_id_ingressando) REFERENCES spl.vereador(ver_id)
    TABLE "spl.registro_presenca" CONSTRAINT "fk_registro_presenca_vereador" FOREIGN KEY (ver_id) REFERENCES spl.vereador(ver_id)
    TABLE "spl.sessao" CONSTRAINT "fk_sessao_vereador" FOREIGN KEY (ver_id) REFERENCES spl.vereador(ver_id)
    TABLE "spl.texto_vereador" CONSTRAINT "fk_texto_vereador_vereador" FOREIGN KEY (ver_id) REFERENCES spl.vereador(ver_id)
    TABLE "geral.usuario" CONSTRAINT "fk_usuario_vereador" FOREIGN KEY (ver_id) REFERENCES spl.vereador(ver_id)
    TABLE "spl.denunciado" CONSTRAINT "fk_vereador" FOREIGN KEY (ver_id) REFERENCES spl.vereador(ver_id)
    TABLE "spl.voto_parecer" CONSTRAINT "fk_voto_parecer_vereador" FOREIGN KEY (ver_id) REFERENCES spl.vereador(ver_id)
    TABLE "spl.voto_plenario" CONSTRAINT "fk_voto_vereador" FOREIGN KEY (ver_id) REFERENCES spl.vereador(ver_id)
Triggers:
    td_vereador AFTER DELETE ON spl.vereador FOR EACH ROW EXECUTE FUNCTION spl.ftd_vereador()
    td_vereador_usu BEFORE DELETE ON spl.vereador FOR EACH ROW EXECUTE FUNCTION spl.ftd_vereador_usu()
    ti_vereador AFTER INSERT ON spl.vereador FOR EACH ROW EXECUTE FUNCTION spl.fti_vereador()
    ti_vereador_gabinete BEFORE INSERT ON spl.vereador FOR EACH ROW EXECUTE FUNCTION spl.fti_vereador_gabinete()
    tu_vereador AFTER UPDATE ON spl.vereador FOR EACH ROW EXECUTE FUNCTION spl.ftu_vereador()
    tu_vereador_desativar AFTER UPDATE ON spl.vereador FOR EACH ROW EXECUTE FUNCTION spl.ftu_vereador_desativar()
    tu_vereador_gabinete_usuario BEFORE UPDATE ON spl.vereador FOR EACH ROW EXECUTE FUNCTION spl.ftu_vereador_gabinete_usuario()
    tz_audit_spl_vereador AFTER INSERT OR DELETE OR UPDATE ON spl.vereador FOR EACH ROW EXECUTE FUNCTION auditoria.f_audit_spl_vereador()
Tablespace: "data"
Access method: heap

