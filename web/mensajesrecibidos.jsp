<%-- 
    Document   : mensajesrecibidos
    Created on : 26/05/2015, 08:48:39 PM
    Author     : sergio
--%>

<%@page import="java.util.Vector"%>
<%@page import="modelo.registro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/bootstrap.min.css">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    </head>
    <body>
        <table class="table table-striped">
                <thead>
   
                    <th>Emisor</th>
                    <th>Petición</th>
                    <th>Fecha y Hora de Envio</th>
                    <th>Fecha y Hora a cumplir</th>
                    <th>Fecha y Hora a despues de la revocacion</th>
                    <th>Tiempo restante</th>
                    <th>Numero de revocaciones</th>
                    <th>Dias añadidos</th>
                </thead>
                <tr>
                    <%     
          Vector<registro> regis = registro.listamensajesresi(Integer.parseInt(request.getParameter("idnodo")));
          for(int i=0;i<regis.size();i++)
            {%>
                   
                    <th><%=regis.get(i).getReceptor()%></th>
                    <th><%=regis.get(i).getPeticion()%></th> 
                    <th><%=regis.get(i).getHoraenvio()%></th>
                    <th><%=regis.get(i).getHoraentrega()%></th>
                    <th><%=regis.get(i).getTp2()%></th>
                    <th><%=regis.get(i).getTiemporest()%></th>
                    <%if(regis.get(i).getPromesa()==0){%>
                    <th><form action="Promesa" method="post">
                            <input type="hidden" value="<%=regis.get(i).getMensaje()%>" name="idmsg">
                            <input type="radio" name="Promesa" value="1">Si
                            <input type="radio" name="Promesa" value="2">No
                            <input type="radio" name="Promesa" value="3">Si condicional
                            <input type="submit" value="Aceptar" name="">

                
                            </form></th>
                    <%}%>
                    <%if(regis.get(i).getPromesa()==1){%>
                    <th><%=regis.get(i).getRevocaciones()%></th>
                    <th><%=regis.get(i).getDiasrevocacion()%></th>
                     
                    <%if(regis.get(i).getRevocaciones()<=2){%>
                    
                    <th><form action="Posponer" method="post">
                            <input type="hidden" value="<%=regis.get(i).getMensaje()%>" name="idmsg">
                            <input type="hidden" value="<%=regis.get(i).getTp2()%>" name="tp2">
                        <select name="posponer">
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                           
                        </select>
                            <input type="submit" value="Pedir mas tiempo" name="">
                        </form>
                    </th>
                    
                    
                    <%}
                    else
                    {%>
                    <th>NO TIENES MAS REVOCACIONES</th>    
                    <%}
                    }%>
                    
                    <%if(regis.get(i).getPromesa()==2){%>                     
                    <th>rechazaste esta solicitud</th>
                    <%}%>
                    
                    </tr>
             <%}%>
                
            </table>
             
    </body>
</html>