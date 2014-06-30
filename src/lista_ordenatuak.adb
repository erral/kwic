package body Lista_Ordenatuak is

   procedure Sortu_Hutsa (Z:out Lista_Ordenatua) is
   begin
      Z:=null;
   exception
      when Storage_Error => raise Lekurik_Ez;
   end Sortu_Hutsa;

   procedure Kokatu (L:in out Lista_Ordenatua; Z:in Osagai) is
      Unekoa,Aurrekoa: Lista_Ordenatua;
   begin
      Aurrekoa:=null; --Hasieraketak
      Unekoa:=L;
      while Unekoa /= null and then Aurretik(Esan_gakoa(Unekoa.Elem),Esan_gakoa(Z)) loop
         Aurrekoa:=Unekoa;
         Unekoa:=Unekoa.Hurrengoa;
      end loop; --Kokatzeko leku egokia aurkitu dugu !
      if Aurrekoa=null then --Hasieran txertatu behar da
         L:=new Nodo;
         Asignatu(Z,L.Elem);
         L.Hurrengoa:=L;
         else --Tartean edo bukaeran txertatu behar da       
         Aurrekoa.Hurrengoa:=new Nodo;
         Asignatu(Z,Aurrekoa.Hurrengoa.Elem);
         Aurrekoa.Hurrengoa.Hurrengoa:=Unekoa;
      end if;
   exception
      when Storage_Error => raise Lekurik_Ez;      
   end Kokatu;

   procedure Kopiatu(L:in Lista_Ordenatua; L1:out Lista_Ordenatua) is
      Unekoa:Lista_Ordenatua;
   begin
      Unekoa:=L;
      L1:=new Nodo;
      if Unekoa = null then
         L1:=null;
      else
         Asignatu (Unekoa.Elem,L1.Elem);
         Kopiatu(Unekoa.Hurrengoa,L1.Hurrengoa);
      end if;
   exception
      when Storage_Error => raise Lekurik_Ez;
   end Kopiatu;

   function Berdin (L1,L2:in Lista_Ordenatua) return Boolean is
      Unekoa1, Unekoa2: Lista_Ordenatua;
   begin
      Unekoa1:=L1;
      Unekoa2:=L2;
      while Unekoa1/=null and then Unekoa2/=null loop
         if Berdin(Unekoa1.Elem,Unekoa2.Elem) then
               Unekoa1:=Unekoa1.Hurrengoa;
               Unekoa2:=Unekoa2.Hurrengoa;
         else
               return False;
         end if;
      end loop;
      if Unekoa1=null and Unekoa2=null then
         return True;
      else
         return false;
      end if;
   end Berdin;

   function Lehena (L:in Lista_Ordenatua) return Osagai is
   begin
     return L.Elem;
   
   exception
      when Constraint_Error => raise Hutsik_Dago;
   end Lehena;

   function Azkena (L:in Lista_Ordenatua) return Osagai is 
   Unekoa:Lista_Ordenatua;
   O:Osagai;
   begin
      Unekoa:=L;
      if Unekoa=null then
         raise Hutsik_Dago;
      else
         while Unekoa.Hurrengoa /= null loop
            Unekoa:=Unekoa.Hurrengoa;
         end loop;
         Asignatu(Unekoa.Elem,O);
         return O;
      end if;
   end Azkena;
   
   procedure Hondarra (L:in out Lista_Ordenatua) is
   begin
      L:=L.Hurrengoa;
   exception
      when Constraint_Error => raise Hutsik_Dago;
   end Hondarra;

   function Hutsa_Da (L:in Lista_Ordenatua) return Boolean is
   begin
      return L=null;
   end Hutsa_Da;

   procedure Lehena_Kendu(L:in out Lista_Ordenatua) is
   begin
      L:=L.Hurrengoa;
   exception
      when Constraint_error => raise Hutsik_Dago;
   end Lehena_Kendu;

   procedure Erantsi_bukaeran(L:in out Lista_Ordenatua; O:in Osagai) is
   Unekoa:Lista_Ordenatua;
   begin
      Unekoa:=L;
      if Unekoa=null then
         L:=new Nodo;
         Asignatu(O,L.Elem);
         L.Hurrengoa:=null;
      else
         while Unekoa.Hurrengoa /= null loop
            Unekoa:=Unekoa.Hurrengoa;
         end loop;
         Unekoa.Hurrengoa:=new Nodo;
         Asignatu(O,Unekoa.Hurrengoa.Elem);
         Unekoa.Hurrengoa.Hurrengoa:=null;
      end if;
   exception
      when Storage_Error => raise Lekurik_Ez;
   end Erantsi_bukaeran;

      procedure Bilatu_Elementua_Ordenan (
         L        : in     Lista_Ordenatua; 
         K        : in     Gako;            
         O        :    out Osagai;          
         Aurkitua :    out Boolean          ) is 
      Unekoa : Lista_Ordenatua; 
   begin
      Unekoa:=L;
      Aurkitua:=False;
      while not Aurkitua and Unekoa/= null loop
         if Berdin(Esan_gakoa(Unekoa.Elem),K) then
            Aurkitua:=True;
            Asignatu(Unekoa.Elem,O);
         else
            Unekoa:=Unekoa.Hurrengoa;
         end if;
      end loop;
   end Bilatu_Elementua_Ordenan; 





end Lista_Ordenatuak;