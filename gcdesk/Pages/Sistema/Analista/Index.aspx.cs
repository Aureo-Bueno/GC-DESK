﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Pages_Sistema_Colaborador_Index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        User user = (User)Session["USER_BD"];
        TicketBD ticket = new TicketBD();
        UserBD userBD = new UserBD();  
        int ID = user.UserId;

        if (user != null)
        {
            LoadTickets();
            LoadNotification();
            if (gdvTickets.Rows.Count > 0)
                gdvTickets.HeaderRow.TableSection = TableRowSection.TableHeader;

            lblOpenCalls.Text = Convert.ToString(ticket.SelectAllOpen());
            lblProgressCalls.Text = Convert.ToString(ticket.SelectProgressAnalyst(ID));
            lblFinishedCalls.Text = Convert.ToString(ticket.SelectFinishedAnalyst(ID));
            lblQuantityPerson.Text = Convert.ToString(userBD.SelectQuantityPerson());
        }
        else
        {
            Response.Redirect("../Pages/PageError/Error404.aspx");
        }

      


    }

    protected void btn_Click(object sender, EventArgs e)
    {
        Page.ClientScript.RegisterStartupScript(this.GetType(), "script", "var myModal = new bootstrap.Modal(document.getElementById('exampleModal'), {});" +
           "document.onreadystatechange = function () {" +
           " myModal.show();" +
           "};", true);
    }


    void LoadTickets()
    {
        DataSet dsTicket = TicketBD.SelectTicketOpen();
        int qtd = dsTicket.Tables[0].Rows.Count;
        gdvTickets.Visible = false;
        if (qtd > 0)
        {
            gdvTickets.DataSource = dsTicket.Tables[0].DefaultView;
            gdvTickets.DataBind();
            gdvTickets.HeaderRow.TableSection = TableRowSection.TableHeader;
            gdvTickets.Visible = true;
        }
        else
        {
            lblTableNull.Text = @"<div class='alert alert-info text-center' role='alert'>Sem Chamados em Aberto!</div>";
        }
    }
    void LoadNotification()
    {
        User user = (User)Session["USER_BD"];
        UserBD userBD = new UserBD();
        int ID = user.UserId;

        DataSet dsNotification = NotificationBD.SelectNotificationAnalisty(ID);
        int qtd = dsNotification.Tables[0].Rows.Count;
        gdvNotification.Visible = false;
        if (qtd > 0)
        {
            gdvNotification.DataSource = dsNotification.Tables[0].DefaultView;
            gdvNotification.DataBind();
            gdvNotification.HeaderRow.TableSection = TableRowSection.TableHeader;
            gdvNotification.Visible = true;
        }
        else
        {
            lblTableNullNotification.Text = @"<div class='alert alert-info text-center' role='alert'>Nenhuma notificação em aberto!</div>";
        }
    }
    protected void gdvNotification_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (e.Row.Cells[0].Text == "0")
            {
                e.Row.Cells[0].Text = "<i class='text-primary fa fa-spinner'></i>";
            }
            else if (e.Row.Cells[0].Text == "1")
            {
                e.Row.Cells[0].Text = "<i class='text-warning fa fa-clock'></i>";

            }
            else if (e.Row.Cells[0].Text == "2")
            {
                e.Row.Cells[0].Text = "<i class='text-success fa fa-check'></i>";
            }
        }
    }
    protected void gdvTickets_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            LinkButton lkbPegar = new LinkButton();
            lkbPegar = (LinkButton)e.Row.Cells[3].FindControl("lkbPegar");

            lkbPegar.Text = "<i class='fa-solid fa-hand'></i>";
            lkbPegar.CommandName = "vazio";
        }
    }

    protected void gdvTickets_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        User user = (User)Session["USER_BD"];
        TicketBD ticket = new TicketBD();
        UserBD userBD = new UserBD();

        int ID = user.UserId;
        string timeMessage = DateTime.Now.ToString(@"dd/MM/yyyy HH:mm:ss");

        int codigoTicket = Convert.ToInt32(e.CommandArgument.ToString());
        Convert.ToString(ticket.UpdateTicketAnaSt(ID, codigoTicket));
        ticket.InsertNotificationStatusProgress(codigoTicket, timeMessage);

        lblMsg.Text = @"<div class='toast-container position-absolute top-0 end-0 p-3' id='toastPlacement'>
                                  <div class='toast'>
                                     <div class='toast-header'>
                                        <svg class='bi flex-shrink-0 me-2 text-success' width='24' height='24' role='img' aria-label='Warning: '><use xlink:href='#exclamation-triangle-fill'/></svg>
                                        <strong class='me-auto'>Sucesso!</strong>
                                        <small>Agora</small>
                                      </div>
                                      <div class='toast-body'>
                                        Este chamado agora está em Desenvolvimento por você!
                                      </div>
                                   </div>
                                </div> ";


    }

}
