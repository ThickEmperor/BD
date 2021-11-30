create or replace trigger TG$ID_QUIZZ$BEFORE
  before insert on p_quizz  
  for each row
declare
  -- local variables here
begin
  :New.Id_Quizz:= ID_GEN('Q');
end TG$ID_QUIZZ$BEFORE;
/
