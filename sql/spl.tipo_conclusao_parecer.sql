                                                                                                                                          Table "spl.tipo_conclusao_parecer"
  Column  |         Type          | Collation | Nullable |                          Default                           | Storage  | Compression | Stats target |                                                                      Description                                                                      
----------+-----------------------+-----------+----------+------------------------------------------------------------+----------+-------------+--------------+-------------------------------------------------------------------------------------------------------------------------------------------------------
 tcp_id   | integer               |           | not null | nextval('spl.tipo_conclusao_parecer_tcp_id_seq'::regclass) | plain    |             |              | 
 tcp_nome | character varying(40) |           | not null |                                                            | extended |             |              | Pelo arquivamento, pela tramitação, pela anexação, por mais informações, pela devolução ao autor, pela derrubada do veto, pela manutenção do veto,...
 versao   | integer               |           | not null | 0                                                          | plain    |             |              | Nº de versão, para lock otimista
Indexes:
    "pktipo_conclusao_parecer" PRIMARY KEY, btree (tcp_id), tablespace "index"
Referenced by:
    TABLE "spl.parecer" CONSTRAINT "fk_parecer_tipo_conclusao_parecer" FOREIGN KEY (tcp_id) REFERENCES spl.tipo_conclusao_parecer(tcp_id)
    TABLE "spl.texto_vereador" CONSTRAINT "fk_texto_vereador_tipo_conclusao_parecer" FOREIGN KEY (tcp_id) REFERENCES spl.tipo_conclusao_parecer(tcp_id)
Triggers:
    tz_audit_spl_tipo_conclusao_parecer AFTER INSERT OR DELETE OR UPDATE ON spl.tipo_conclusao_parecer FOR EACH ROW EXECUTE FUNCTION auditoria.f_audit_spl_tipo_conclusao_parecer()
Tablespace: "data"
Access method: heap

