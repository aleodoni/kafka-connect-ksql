SELECT 
  rc.rec_id, 
  rc.con_id, 
  rc.rec_tipo_reuniao, 
  rc.rec_numero, 
  rc.rec_data, 
  pc.pac_id,   
  cv.con_sigla, 
  cv.ini_nome 
FROM 
  tb_pauta_comissao pc
JOIN tb_conjunto_vereadores AS cv ON cv.con_id = rc.con_id
JOIN tb_reuniao_comissao AS rc ON pc.rec_id=rc.rec_id
  
EMIT CHANGES;

INNER JOIN tb_pauta_comissao pc ON pc.rec_id=rc.rec_id
pc.pac_id, 



SELECT 
  rc.rec_id, 
  rc.con_id, 
  rc.rec_tipo_reuniao, 
  rc.rec_numero, 
  rc.rec_data, 
  pc.pac_id, 
  cv.con_sigla, 
  cv.ini_nome 
FROM 
  t_reuniao_comissao rc 
LEFT JOIN 
  tb_conjunto_vereadores cv
ON
  rc.con_id = cv.con_id
LEFT JOIN
  tb_pauta_comissao pc
ON 
  rc.rec_id = pc.rec_id
    
EMIT CHANGES;




SELECT 
  rc.rec_id, 
  rc.con_id, 
  rc.rec_tipo_reuniao, 
  rc.rec_numero, 
  cv.con_sigla
FROM 
  t_reuniao_comissao AS rc 
LEFT JOIN tb_conjunto_vereadores AS cv ON cv.con_id = rc.con_id
EMIT CHANGES;

SELECT 
  rc.rec_id, 
  rc.con_id, 
  rc.rec_tipo_reuniao, 
  rc.rec_numero, 
  pc.pac_id
FROM 
  t_reuniao_comissao AS rc 
LEFT JOIN tb_pauta_comissao AS pc ON pc.rec_id = rc.rec_id
EMIT CHANGES;



SELECT 
  rc.rec_id, 
  rc.con_id, 
  rc.rec_tipo_reuniao, 
  rc.rec_numero, 
  pc.pac_id
FROM 
  reuniao_comissao rc 
INNER JOIN st_pauta_comissao pc 
WITHIN 1 SECONDS
ON pc.rec_id = rc.rec_id
EMIT CHANGES;



SELECT 
  pcrc.rc_rec_id, 
  pcrc.rc_con_id, 
  pcrc.rc_rec_tipo_reuniao, 
  pcrc.rc_rec_numero, 
  CAST(pcrc.rc_rec_data AS DATE) as rec_data, 
  pcrc.pc_pac_id,   
  cv.con_sigla, 
  cv.ini_nome 
FROM 
  tb_reuniao_comissao_joined_pauta_comissao pcrc
LEFT JOIN tb_conjunto_vereadores AS cv ON cv.con_id = pcrc.rc_con_id
EMIT CHANGES;