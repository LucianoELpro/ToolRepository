
1. TABLA TEMPORAL --SE ELIMINA EN EL SCRIP SENTENCIA "DECLARE Y SU @VARIABLE" 
2. TABBLA TEMPORAL FÍSICA -- SE ELEMINA CUANDO CIERRAS EL SQL SENTENCIA "CREATE Y  SU #VARIABLE"



--- TABLA TEMPORAL SE USA DE FORMA TEMPORAL OSEA AL TIEMPO CUANDO TERMINA EL SCRIP

DECLARE @mitabla table(id int identity (1,1),pais varchar(50))

insert into @mitabla values('Peru')
insert into @mitabla values('Argentina')
insert into @mitabla values('Bolivia')

select *  from @mitabla


-- TABLA TEMPORAL FÍSICA

CREATE table #mitabla (id int identity (1,1),pais varchar(50))

insert into #mitabla values('Peru')
insert into #mitabla values('Argentina')
insert into #mitabla values('Bolivia')

select *  from #mitabla



-----------------------------------------------------------------


declare @turnos table (id int identity(1,1),idturno turno,idpaciente paciente)
declare @idpaciente  paciente
set @idpaciente=8

insert into @turnos (idturno,idpaciente)
select tp.idturno,p.idpaciente from tbl_patient p inner join tbl_turnPatient tp
		on tp.id_patient = p.id_patient

declare @i int ,@total int
set @i=1
set @total = (select count(*) from tbl_turn)

	While @i <= @total
begin
	if (select idpaciente from tbl_turn where id=@i)<>8
	delete from @turnos where id=@i

	set @i = @i+1
end

select * from tbl_patient p
		inner join @turnos T on T.idpaciente = p.id_patient

select * from @turnos 