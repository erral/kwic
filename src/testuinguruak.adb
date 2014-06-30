with Hitzak,Ada.Text_Io;
use Ada.Text_Io;
with Ada.Integer_Text_Io;
use Ada.Integer_Text_Io;
package body Testuinguruak is

   procedure Sortu (
         S     : in     String;            
         P     : in     Posizioak.Posizio; 
         Luz   : in     Positive;          
         Testu :    out Testuinguru        ) is 

      H : Hitzak.Hitz;  
   begin
      Hitzak.Sortu(S,H);
      Hitzak.Kopiatu(H,Testu.H);
      Testu.P:=P;
      Testu.L:=Luz;
   exception
      when Storage_Error =>
         raise Lekurik_Ez;
      when Hitzak.Lekurik_Ez =>
         raise Lekurik_Ez;
   end Sortu;

   procedure Inprimatu (
         Testu : in     Testuinguru ) is 


      K,  
      J,  
      H,  
      M         : Integer;  
      Idaztekoa : String (1 .. 80);  
      Temp      : String (Hitzak.Balioa (Testu.H)'First .. Hitzak.Balioa
        (Testu.H)'Last);  
   begin
      for I in Temp'First .. Temp'Last loop
         Temp(I):=' ';
      end loop;
      for I in 1..80 loop
         Idaztekoa(I):=' ';
      end loop;
      Temp:=Hitzak.Balioa(Testu.H);
      J:=35;
      for I in Testu.P .. Testu.P + Testu.L -1 loop
         Idaztekoa(J):=Temp(I);
         J:=J+1;
      end loop;
      H:=Testu.P+Testu.L-1;
      J:=35+Testu.L-1;
      while J <= 80 and H<=Temp'Last loop
         Idaztekoa(J):=Temp(H);
         H:=H+1;
         J:=J+1;
      end loop;
      M:=Testu.P -1;
      K:=34;
      while K>=1 and M>=Temp'First loop
         Idaztekoa(K):=Temp(M);
         M:=M-1;
         K:=K-1;
      end loop;
      for K in 1..80 loop
         if Idaztekoa(K)='\' then
            Idaztekoa(K):=' ';
         end if;
      end loop;
      Put(Idaztekoa);
   end Inprimatu;
end Testuinguruak;