with Ada.Characters.Handling;
package body Tokenizatzailea is

   procedure Hurrengo_Tokena_Lortu (
         F            : in out Ada.Text_Io.File_Type; 
         Tokena       :    out String;                
         L            :    out Natural;               
         Hitz_Motakoa :    out Boolean                ) is 

      function Hitzeko_Karakterea (
            C : in     Character ) 
        return Boolean is 
      begin
         -- hitzeko karakteretzat honakoak onartzen ditu:
         -- letra maiuskula zein minuskulak (azentudunak edo ez,
         -- ñ barne), digituak, marratxoa eta azpimarra (underscore)
         return Ada.Characters.Handling.Is_Letter (C) or
            Ada.Characters.Handling.Is_Digit (C) or
            C = '-' or
            C = '_';
      end Hitzeko_Karakterea;

      Kar : Character;  
      Eol : Boolean;  
   begin
      L := 0;
      Ada.Text_Io.Look_Ahead (F, Kar, Eol);
      if not Eol then
         if Hitzeko_Karakterea (Kar) then -- hitz motako tokena
            while Hitzeko_Karakterea (Kar) and
                  not Eol and
                  not Ada.Text_Io.End_Of_File (F) loop
               Ada.Text_Io.Get (F, Kar);
               L := L + 1;
               Tokena (L) := Kar;
               Ada.Text_Io.Look_Ahead (F, Kar, Eol);
            end loop;
            Hitz_Motakoa := True;
         else  -- bestelako tokena (bereizlea)
            while not Hitzeko_Karakterea (Kar) and
                  not Eol and
                  not Ada.Text_Io.End_Of_File (F) loop
               Ada.Text_Io.Get (F, Kar);
               L := L + 1;
               Tokena (L) := Kar;
               Ada.Text_Io.Look_Ahead (F, Kar, Eol);
            end loop;
            Hitz_Motakoa := False;
         end if;
      else -- Eol = True, lerro-amaiera
         raise Lerro_Amaia;
      end if;
   exception
      when Ada.Text_IO.Mode_Error =>
         raise Modu_Desegokia;
      when Ada.Text_IO.Status_Error =>
         raise Egoera_Desegokia;
   end Hurrengo_Tokena_Lortu;

end Tokenizatzailea;
