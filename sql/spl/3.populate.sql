\c spl;
-- INSERT DATA #################################################################
INSERT INTO reuniao_comissao(
  rec_id,
  con_id,
  rec_tipo_reuniao,
  rec_numero,
  versao,
  rec_data
) VALUES(
  3911,
  13796,
  'Ordinária',
  '1ª',
  0,
  current_timestamp
);

INSERT INTO reuniao_comissao(
  rec_id,
  con_id,
  rec_tipo_reuniao,
  rec_numero,
  versao,
  rec_data
) VALUES(
  3923,
  9068,
  'Ordinária',
  '01ª, às 14h, na Sala das Comissões',
  0,
  current_timestamp
);

INSERT INTO reuniao_comissao(
  rec_id,
  con_id,
  rec_tipo_reuniao,
  rec_numero,
  versao,
  rec_data
) VALUES(
  3924,
  69,
  'Ordinária',
  '1ª, às 14h, na Sala de Comissões',
  0,
  current_timestamp
);

-- -----------------------------------------------------------------------------
INSERT INTO pauta_comissao(
  pac_id,
  rec_id,
  pac_notificada,
  pac_liberada,
  versao
) VALUES(
  1620,
  3911,
  true,
  true,
  0
);

INSERT INTO pauta_comissao(
  pac_id,
  rec_id,
  pac_notificada,
  pac_liberada,
  versao
) VALUES(
  1623,
  3923,
  true,
  true,
  0
);

INSERT INTO pauta_comissao(
  pac_id,
  rec_id,
  pac_notificada,
  pac_liberada,
  versao
) VALUES(
  1624,
  3924,
  true,
  true,
  0
);

-- -----------------------------------------------------------------------------
INSERT INTO conjunto_vereadores(
  con_id, 
  con_sigla, 
  con_maximo, 
  ut_id, 
  ini_nome, 
  ini_ativa, 
  tin_id, 
  versao, 
  ini_codigo_prefeitura, 
  con_descricao, 
  con_site_ordem, 
  con_email
) VALUES(
  13796,
  'CE LO 001.00001.2019',
  5,
  1,
  'Comissão Especial Alteração Lei Orgânica 001.00001.2019',
  true,
  4,
  0,
  1,
  '',
  0,
  ''
);

INSERT INTO conjunto_vereadores(
  con_id, 
  con_sigla, 
  con_maximo, 
  ut_id, 
  ini_nome, 
  ini_ativa, 
  tin_id, 
  versao, 
  ini_codigo_prefeitura, 
  con_descricao, 
  con_site_ordem, 
  con_email
) VALUES(
  9068,
  'CCJ',
  5,
  1,
  'Comissão de Constituição e Justiça',
  true,
  4,
  0,
  1,
  '',
  0,
  ''
);

INSERT INTO conjunto_vereadores(
  con_id, 
  con_sigla, 
  con_maximo, 
  ut_id, 
  ini_nome, 
  ini_ativa, 
  tin_id, 
  versao, 
  ini_codigo_prefeitura, 
  con_descricao, 
  con_site_ordem, 
  con_email
) VALUES(
  69,
  'C.Economia',
  5,
  1,
  'Comissão de Economia, Finanças e Fiscalização',
  true,
  4,
  0,
  1,
  '',
  0,
  ''
);

-- -----------------------------------------------------------------------------
INSERT INTO proposicoes_pauta_reuniao(
  pac_id, 
  par_id, 
  codigo_proposicao, 
  iniciativa, 
  sumula, 
  relator, 
  conclusao_relator, 
  conclusao_comissao, 
  tem_emendas
) VALUES(
  1620,
  32051,
  '001.00001.2019',
  'Professor Euler, Beto Moraes, Bruno Pessuti, Cacá Pereira, Colpani, Cristiano Santos, Dona Lourdes, Dr. Wolmir, Edson do Parolin, Ezequias Barros, Fabiane Rosa, Felipe Braga Côrtes, Geovane Fernandes, Herivelto Oliveira, Jairo Marcelino, Jonny Stica, Julieta Reis, Katia Dittrich, Marcos Vieira, Maria Leticia, Maria Manfron, Mauro Bobato, Mauro Ignácio, Mestre Pop, Noemia Rocha, Oscalino do Povo, Osias Moraes, Paulo Rink, Pier Petruzziello, Professora Josete, Professor Silberto, Rogério Campos, Sabino Picolo, Sergio R. B. Balaguer (Serginho do Posto), Tico Kuzma, Tito Zeglin, Toninho da Farmácia, Zezinho Sabará',
  'Altera o Parágrafo Único do art. 78 da Lei Orgânica do Município de Curitiba.',
  'Bruno Pessuti',
  'Pela tramitação',
  'Pela tramitação',
  null
);

INSERT INTO proposicoes_pauta_reuniao(
  pac_id, 
  par_id, 
  codigo_proposicao, 
  iniciativa, 
  sumula, 
  relator, 
  conclusao_relator, 
  conclusao_comissao, 
  tem_emendas
) VALUES(
   1623,
   32017,
   '005.00183.2022',
   'Nori Seto',
   'Altera a Lei Ordinária nº 15.852, de 1º de julho de 2021, para aperfeiçoar a Política Municipal de Proteção Animal.',
   'Denian Couto',
   'Pela tramitação',
   'Pela tramitação',
   null
);

INSERT INTO proposicoes_pauta_reuniao(
  pac_id, 
  par_id, 
  codigo_proposicao, 
  iniciativa, 
  sumula, 
  relator, 
  conclusao_relator, 
  conclusao_comissao, 
  tem_emendas
) VALUES(
   1623,
   32033,
   '005.00186.2022',
   'Jornalista Márcio Barros',
   'Dispõem sobre a substituição gradativa das sirenes e alarmes utilizados pelos estabelecimentos de ensino da rede pública e privada municipal de Curitiba por outros meios não agressivos e inclusivos de indicação horária.',
   'Amália Tortato',
   'Por mais informações',
   'Por mais informações',
   null
);

INSERT INTO proposicoes_pauta_reuniao(
  pac_id, 
  par_id, 
  codigo_proposicao, 
  iniciativa, 
  sumula, 
  relator, 
  conclusao_relator, 
  conclusao_comissao, 
  tem_emendas
) VALUES(
  1623,
  32021,
  '005.00108.2022',
  'Professor Euler',
  'Determina que as competições paraesportivas realizadas em Curitiba possuam categoria destinada a pessoas com o Transtorno do Espectro Autista com QI maior que 75.',
  'Marcelo Fachinello',
  'Pela tramitação',
  'Pela tramitação',
  null
);

INSERT INTO proposicoes_pauta_reuniao(
  pac_id, 
  par_id, 
  codigo_proposicao, 
  iniciativa, 
  sumula, 
  relator, 
  conclusao_relator, 
  conclusao_comissao, 
  tem_emendas
) VALUES(
  1623,
  32032,
  '004.00005.2022',
  'Comissão Executiva',
  'Altera o Anexo I da Resolução nº 04 de 18 de novembro de 2019.',
  'Denian Couto',
  'Pela tramitação',
  '',
  null
);

INSERT INTO proposicoes_pauta_reuniao(
  pac_id, 
  par_id, 
  codigo_proposicao, 
  iniciativa, 
  sumula, 
  relator, 
  conclusao_relator, 
  conclusao_comissao, 
  tem_emendas
) VALUES(
  1623,
  32038,
  '002.00006.2022',
  'Prefeito',
  'Dispõe sobre o Programa de Apoio, Fomento e Incentivo à Cultura de Curitiba - PAFICC, o Fundo Municipal da Cultura de Curitiba - FMCC, altera a Lei Complementar nº 57, de 8 de dezembro de 2005, e revoga as Leis Complementares nºs 59, de 14 de setembro de 2006, 122, de 19 de agosto de 2020, 127, de 17 de março de 2021, e 128, de 10 de setembro de 2021.',
  'Mauro Ignácio',
  'Pela tramitação',
  'Pela tramitação',
  null
);

INSERT INTO proposicoes_pauta_reuniao(
  pac_id, 
  par_id, 
  codigo_proposicao, 
  iniciativa, 
  sumula, 
  relator, 
  conclusao_relator, 
  conclusao_comissao, 
  tem_emendas
) VALUES(
  1623,
  32010,
  '005.00114.2022',
  'Marcos Vieira',
  'Institui a parceria para atendimento de jovens em situação de vulnerabilidade socioeconômica.',
  'Pier Petruzziello',
  'Pelo arquivamento',
  '',
  null
);

INSERT INTO proposicoes_pauta_reuniao(
  pac_id, 
  par_id, 
  codigo_proposicao, 
  iniciativa, 
  sumula, 
  relator, 
  conclusao_relator, 
  conclusao_comissao, 
  tem_emendas
) VALUES(
  1623,
  32042,
  '005.00082.2022',
  'Professor Euler, Denian Couto',
  'Acrescenta os parágrafos 3º e 4º ao artigo 4º e revoga o inciso III do artigo 3º da Lei 3.979 de 05 de novembro de 1971, que autoriza o Executivo a estabelecer, nos bens de uso comum do povo, estacionamento de veículos, e dá outras providências.',
  'Amália Tortato',
  'Pela tramitação',
  'Pela tramitação',
  null
);

INSERT INTO proposicoes_pauta_reuniao(
  pac_id, 
  par_id, 
  codigo_proposicao, 
  iniciativa, 
  sumula, 
  relator, 
  conclusao_relator, 
  conclusao_comissao, 
  tem_emendas
) VALUES(
  1623,
  32043,
  '005.00120.2022',
  'Professor Euler',
  'Acrescenta parágrafos ao artigo 3° da Lei n° 14.633 de 14 de abril de 2015, que Dispõe sobre a permissão para o funcionamento da bancas de jornais e revistas no Município de Curitiba e dá outras providencias.',
  'Pier Petruzziello',
  'Pela tramitação',
  'Pela tramitação',
  null
);

INSERT INTO proposicoes_pauta_reuniao(
  pac_id, 
  par_id, 
  codigo_proposicao, 
  iniciativa, 
  sumula, 
  relator, 
  conclusao_relator, 
  conclusao_comissao, 
  tem_emendas
) VALUES(
  1623,
  32047,
  '005.00078.2022',
  'Marcos Vieira',
  ' Dispõe sobre a obrigatoriedade de informação sobre a qualidade da água consumida pela população de Curitiba.\r\n \r\n ',
  'Marcelo Fachinello',
  'Pela tramitação',
  'Pela tramitação',
  null
);

INSERT INTO proposicoes_pauta_reuniao(
  pac_id, 
  par_id, 
  codigo_proposicao, 
  iniciativa, 
  sumula, 
  relator, 
  conclusao_relator, 
  conclusao_comissao, 
  tem_emendas
) VALUES(
  1623,
  32011,
  '005.00138.2022',
  'Carol Dartora, Dalton Borba, Professora Josete, Giorgia Prates - Mandata Preta, Angelo Vanhoni',
  'Dispõe sobre a restrição do uso, pelo Poder Público, de tecnologias de reconhecimento facial que envolvam a segurança pública e identificação em massa de cidadãos em espaços públicos.',
  'Amália Tortato',
  'Por mais informações',
  'Por mais informações',
  null
);

INSERT INTO proposicoes_pauta_reuniao(
  pac_id, 
  par_id, 
  codigo_proposicao, 
  iniciativa, 
  sumula, 
  relator, 
  conclusao_relator, 
  conclusao_comissao, 
  tem_emendas
) VALUES(
  1623,
  32064,
  '005.00106.2022',
  'Renato Freitas, Professora Josete, Angelo Vanhoni',
  'Veda o uso de arquitetura hostil nos espaços livres de uso público urbanos em Curitiba.',
  'Amália Tortato',
  'Pela devolução ao autor',
  'Pela devolução ao autor',
  null
);

INSERT INTO proposicoes_pauta_reuniao(
  pac_id, 
  par_id, 
  codigo_proposicao, 
  iniciativa, 
  sumula, 
  relator, 
  conclusao_relator, 
  conclusao_comissao, 
  tem_emendas
) VALUES(
  1623,
  32049,
  '014.00047.2022',
  'Pier Petruzziello',
  'Declara de Utilidade Pública a Associação JUNTOS PARA-NA.\r\n\n\r\n ',
  'Amália Tortato',
  'Pela devolução ao autor',
  'Pela devolução ao autor',
  null
);

INSERT INTO proposicoes_pauta_reuniao(
  pac_id, 
  par_id, 
  codigo_proposicao, 
  iniciativa, 
  sumula, 
  relator, 
  conclusao_relator, 
  conclusao_comissao, 
  tem_emendas
) VALUES(
  1623,
  32035,
  '005.00247.2021',
  'Maria Leticia, Carol Dartora, Flavia Francischini, Marcos Vieira, Noemia Rocha, Professora Josete, Renato Freitas, Giorgia Prates - Mandata Preta',
  'Dispõe sobre o compartilhamento de bicicletas em vias e logradouros públicos no Município de Curitiba e dá outras providências.',
  'Marcelo Fachinello',
  'Pela devolução ao autor',
  'Pela devolução ao autor',
  null
);

INSERT INTO proposicoes_pauta_reuniao(
  pac_id, 
  par_id, 
  codigo_proposicao, 
  iniciativa, 
  sumula, 
  relator, 
  conclusao_relator, 
  conclusao_comissao, 
  tem_emendas
) VALUES(
  1623,
  32016,
  '008.00010.2022',
  'Sidnei Toaldo',
  'Denomina de Luiz Marcelo Pimpão Ferraz, um dos logradouros públicos da Capital, conforme especifica.',
  'Beto Moraes',
  'Pelo arquivamento',
  'Pelo arquivamento',
  null
);

INSERT INTO proposicoes_pauta_reuniao(
  pac_id, 
  par_id, 
  codigo_proposicao, 
  iniciativa, 
  sumula, 
  relator, 
  conclusao_relator, 
  conclusao_comissao, 
  tem_emendas
) VALUES(
  1623,
  32062,
  '005.00173.2022',
  'Rodrigo Marcial',
  'Altera dispositivos da Lei nº 11.642, de 22 de dezembro de 2005, que Institui o programa de adoção de logradouros públicos e dá outras providências, para ampliar o rol de logradouros a serem adotados.',
  'Angelo Vanhoni',
  'Pela devolução ao autor',
  'Pela devolução ao autor',
  null
);

INSERT INTO proposicoes_pauta_reuniao(
  pac_id, 
  par_id, 
  codigo_proposicao, 
  iniciativa, 
  sumula, 
  relator, 
  conclusao_relator, 
  conclusao_comissao, 
  tem_emendas
) VALUES(
  1623,
  32009,
  '005.00145.2022',
  'Marcos Vieira',
  'Institui o uso do Cordão Quebra-Cabeça e a Carteira de Identificação da Pessoa com Transtorno do Espectro Autista como instrumentos auxiliares na identificação de pessoas com Transtorno do Espectro Autista (TEA).',
  'Marcelo Fachinello',
  'Pelo arquivamento',
  'Pelo arquivamento',
  null
);

INSERT INTO proposicoes_pauta_reuniao(
  pac_id, 
  par_id, 
  codigo_proposicao, 
  iniciativa, 
  sumula, 
  relator, 
  conclusao_relator, 
  conclusao_comissao, 
  tem_emendas
) VALUES(
  1623,
  32013,
  '008.00008.2022',
  'Alexandre Leprevost',
  'Denomina de Roque Nadolny, um dos logradouros públicos da Capital, conforme especifica.',
  'Marcelo Fachinello',
  'Pela devolução ao autor',
  'Pela devolução ao autor',
  null
);

INSERT INTO proposicoes_pauta_reuniao(
  pac_id, 
  par_id, 
  codigo_proposicao, 
  iniciativa, 
  sumula, 
  relator, 
  conclusao_relator, 
  conclusao_comissao, 
  tem_emendas
) VALUES(
  1623,
  32048,
  '005.00081.2022',
  'Professor Euler',
  'Acrescenta Páragrafo único no Art. 186 da Lei 15.511 de 10 de outubro de 2019, que Dispõe sobre o zoneamento, uso e ocupação do solo no Município de Curitiba e dá outras providências.',
  'Marcelo Fachinello',
  'Pelo arquivamento',
  'Pelo arquivamento',
  null
);

INSERT INTO proposicoes_pauta_reuniao(
  pac_id, 
  par_id, 
  codigo_proposicao, 
  iniciativa, 
  sumula, 
  relator, 
  conclusao_relator, 
  conclusao_comissao, 
  tem_emendas
) VALUES(
  1624,
  32026,
  '005.00164.2022',
  'Prefeito',
  'Dispõe sobre a criação do Sistema Municipal de Esporte e Lazer de Curitiba.',
  'Rodrigo Marcial',
  'Pela tramitação',
  'Pela tramitação',
  null
);

-- -----------------------------------------------------------------------------
INSERT INTO texto_conclusao_autor(
  pro_id, 
  pro_codigo, 
  par_id,	
  txt_data, 
  txt_finalizado, 
  txt_relator,	
  txt_id,	
  ver_id,	
  vereador, 
  tcp_id, 
  tcp_nome, 
  par_finalizado, 
  con_id
) VALUES(
  1234,
  '001.00001.2019',
  32051,
  '2022-01-01',
  true,
  true,
  1891,
  6,
  'Vereador 1',
  1,
  'Pela Tramitação',
  false,
  13796 
);

INSERT INTO texto_conclusao_autor(
  pro_id, 
  pro_codigo, 
  par_id,	
  txt_data, 
  txt_finalizado, 
  txt_relator,	
  txt_id,	
  ver_id,	
  vereador, 
  tcp_id, 
  tcp_nome, 
  par_finalizado, 
  con_id
) VALUES(
  1122,
  '004.00005.2022',
  32032,
  '2022-01-01',
  true,
  true,
  1892,
  6,
  'Vereador 2',
  1,
  'Pela Tramitação',
  false,
  9068 
);
