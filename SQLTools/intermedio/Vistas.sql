
1. -- crear vista por el scrip
2. --crear vista por el explorador



create view pacienteTurnosPendiente as

select p.idpaciente,p.nombre,p.apellido,t.idturno,t.estado
		from tbl.patient p inner join tbl_turnPatient tp on tp.id_patient=p.idPaciente
		inner join tbl_turn t
		on t.id_turn = tp.id_turn
		where ISNULL(t.estado,0)=0