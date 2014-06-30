with Hitzak;
package Dokumentua is

   Fitxategi_Ezezaguna,  
   Errorea_Irekitzean,  
   Errorea_Ixtean,  
   Errorea_Ezabatzean,  
   Fitxategi_Handiegia,  
   Hasieratze_Okerra   : exception;  

   procedure Hasieratu; 

   procedure Bukatu; 

   procedure Hitzaren_Testuinguruak_Inprimatu (
         H : in     Hitzak.Hitz ); 

end Dokumentua;