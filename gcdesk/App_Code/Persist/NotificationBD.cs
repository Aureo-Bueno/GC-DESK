﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for NotificationBD
/// </summary>
public class NotificationBD
{
    public static DataSet SelectNotification(int id)
    {
        DataSet ds = new DataSet();
        IDbConnection objConection;
        IDbCommand objCommand;
        IDataAdapter objAdapter;
        objConection = Mapped.Connection();
        string sql = "SELECT * FROM notification A INNER JOIN ticket B ON A.tic_id = B.tic_id WHERE user_id =?cod ORDER BY not_id DESC";
        objCommand = Mapped.Command(sql, objConection);
        objAdapter = Mapped.Adapter(objCommand);
        objCommand.Parameters.Add(Mapped.Parameter("?cod", id));
        objAdapter.Fill(ds);
        objCommand.Dispose();
        objConection.Close();
        objConection.Dispose();
        return ds;
    }
    public static DataSet SelectNotificationAnalisty(int id)
    {
        DataSet ds = new DataSet();
        IDbConnection objConection;
        IDbCommand objCommand;
        IDataAdapter objAdapter;
        objConection = Mapped.Connection();
        string sql = "SELECT * FROM notification A INNER JOIN ticket B ON A.tic_id = B.tic_id WHERE ana_analisty_id =?cod AND not_status!=0 ORDER BY not_id DESC";
        objCommand = Mapped.Command(sql, objConection);
        objAdapter = Mapped.Adapter(objCommand);
        objCommand.Parameters.Add(Mapped.Parameter("?cod", id));
        objAdapter.Fill(ds);
        objCommand.Dispose();
        objConection.Close();
        objConection.Dispose();
        return ds;
    }

    /// <summary>
    /// 
    /// --> Metodo sendo utilizado na  AnalystTicke<--
    /// 
    /// </summary>
    /// <param name="idTicket"></param>
    /// <param name="timeMessage"></param>
    /// <returns>Insere no banco o status de finalizado para o chamado</returns>
    public int InsertNotificationStatusFinished(int idTicket, string timeMessage)
    {
        try
        {
            IDbConnection dbConnection;
            IDbCommand dbCommand;
            string sql = @"INSERT INTO notification (not_description, not_title, tic_id, not_timeMensage, not_status) 
                        VALUES ('O seu chamado foi finalizado, poderia nos enviar uma avaliação por favor.',
                                'Chamado Finalizado', ?tic_id, ?timeMessage, '2');";

            dbConnection = Mapped.Connection();
            dbCommand = Mapped.Command(sql, dbConnection);
            dbCommand.Parameters.Add(Mapped.Parameter("?timeMessage", timeMessage));
            dbCommand.Parameters.Add(Mapped.Parameter("?tic_id", idTicket));
            dbCommand.ExecuteNonQuery();
            dbConnection.Close();
            dbCommand.Dispose();
            dbConnection.Dispose();
            return 0;
        }
        catch (Exception e)
        {
            return -2;
        }

    }
    public String SelectIdTicket()
    {
        Ticket obj = new Ticket();

        System.Data.IDbConnection objConection;
        System.Data.IDbCommand objCommand;
        System.Data.IDataReader objDataReader;
        objConection = Mapped.Connection();
        objCommand = Mapped.Command("SELECT MAX(tic_id) ULTIMO_ID FROM ticket", objConection);
        objDataReader = objCommand.ExecuteReader();
        while (objDataReader.Read())
        {
            obj.TicketId = Convert.ToInt32(objDataReader["ULTIMO_ID"]);

        }
        string resultado = Convert.ToString(obj.TicketId);
        objDataReader.Close();
        objConection.Close();
        objCommand.Dispose();
        objConection.Dispose();
        objDataReader.Dispose();
        return resultado;
    }

    /// <summary>
    /// 
    /// --> Metodo sendo utilizado nat <--
    /// 
    /// </summary>
    /// <param name="timeMessage"></param>
    /// <returns>Insere no banco um novo status de Notificacao para o chamado</returns>
    public int InsertNotificationStatusCreate(string timeMessage)
    {
        try
        {
            string idTicket = SelectIdTicket();

            IDbConnection dbConnection;
            IDbCommand dbCommand;
            string sql = @"INSERT INTO notification (not_description, not_title, tic_id, not_timeMensage, not_status) 
                        VALUES ('O seu chamado foi criado com sucesso.',
                                'Chamado Criado', ?tic_id, ?timeMessage, 0)";

            dbConnection = Mapped.Connection();
            dbCommand = Mapped.Command(sql, dbConnection);
            dbCommand.Parameters.Add(Mapped.Parameter("?tic_id", idTicket));
            dbCommand.Parameters.Add(Mapped.Parameter("?timeMessage", timeMessage));

            dbCommand.ExecuteNonQuery();
            dbConnection.Close();
            dbCommand.Dispose();
            dbConnection.Dispose();
            return 0;
        }
        catch (Exception e)
        {
            return -2;
        }

    }



}