=CONCATENAR("INSERT INTO paciente VALUES 
('" & C2 & "',
'"&A2&"',
'"&B2&"',
'"&DERECHA(TEXTO(H2;"dd/mm/yyyy");4)&EXTRAE(TEXTO(H2;"dd/mm/yyyy");4;2)&IZQUIERDA(TEXTO(H2;"dd/mm/yyyy");2)&"',
'"&E2&"',
'"&F2&"',
'"&D2&"',
'"&G2&"',
'')")