﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Master/MasterPage.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Pages_Sistema_Colaborador_Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <section id="pageContent">
        <asp:Label ID="lblCdTicket" runat="server" Text=""></asp:Label>
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-12 my-1 d-flex justify-content-center">
                    <div class="card w-75 text-center border-0 shadow pb-4">
                        <div class="card-header border-0 mb-2 text-start bg-transparent">
                            <i class="fa-regular fa-circle-question text-secondary"></i>
                        </div>
                        <div class="d-flex justify-content-center">
                            <div class="rounded-circle bg-success-low" style="width: 70px; height: 70px;">
                                <i class="fa-solid fa-circle-check text-black-50 fs-6 mt-4"></i>
                            </div>
                        </div>
                        <div class="card-body">
                            <asp:Label class="card-title mt-3 fs-1" ID="lblFinishedCalls" runat="server" Text="" />
                            <p class="card-text fs-6 fw-bold text-black-50 mt-3">Chamados Finalizados</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-12 my-1 d-flex justify-content-center">
                    <div class="card w-75 text-center border-0 shadow pb-4">
                        <div class="card-header border-0 mb-2 text-start bg-transparent">
                            <i class="fa-regular fa-circle-question text-secondary"></i>
                        </div>
                        <div class="d-flex justify-content-center">
                            <div class="rounded-circle bg-warning-low" style="width: 70px; height: 70px;">
                                <i class="fa-solid fa-clock text-black-50 fs-6 mt-4"></i>
                            </div>
                        </div>
                        <div class="card-body">
                            <asp:Label class="card-title mt-3 fs-1" ID="lblProgressCalls" runat="server" Text="" />
                            <p class="card-text fs-6 fw-bold text-black-50 mt-3">Chamados em Andamento</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-12 my-1 d-flex justify-content-center">
                    <div class="card w-75 text-center border-0 shadow pb-4">
                        <div class="card-header border-0 mb-2 text-start bg-transparent">
                            <i class="fa-regular fa-circle-question text-secondary"></i>
                        </div>
                        <div class="d-flex justify-content-center">
                            <div class="rounded-circle bg-primary-low" style="width: 70px; height: 70px;">
                                <i class="fa-solid fa-spinner text-black-50 fs-6 mt-4"></i>
                            </div>
                        </div>
                        <div class="card-body">
                            <asp:Label class="card-title mt-3 fs-1" ID="lblOpenCalls" runat="server" Text="" />
                            <p class="card-text fs-6 fw-bold text-black-50 mt-3">Chamados em Aberto (Todos)</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-12 my-1 d-flex justify-content-center">
                    <div class="card w-75 text-center border-0 shadow pb-4">
                        <div class="card-header border-0 mb-2 text-start bg-transparent">
                            <i class="fa-regular fa-circle-question text-secondary"></i>
                        </div>
                        <div class="d-flex justify-content-center">
                            <div class="rounded-circle bg-secondary bg-opacity-50" style="width: 70px; height: 70px;">
                                <i class="fa-solid fa-user text-black-50 fs-6 mt-4"></i>
                            </div>
                        </div>
                        <div class="card-body">
                            <asp:Label class="card-title mt-3 fs-1" ID="lblQuantityPerson" runat="server" Text="" />
                            <p class="card-text fs-6 fw-bold text-black-50 mt-3">Colaboradores Ativos</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section id="pageFooter">
        <div class="container-fluid">
            <div class="row mt-5">
                <asp:Label ID="lblMsg" runat="server" />
                <div class="col-lg-6 col-md-12">
                    <div class="card mb-4">
                        <div class="card-header bg-primary text-white">
                            <i class="fa-solid fa-table me-1"></i>
                            Chamados em Aberto
                        </div>
                        <div class="card-body overflow-auto" style="height: 400px">
                            <div class="table-responsive p-3">
                                <asp:Label ID="lblTableNull" runat="server"></asp:Label>
                                <asp:GridView ID="gdvTickets" runat="server" AutoGenerateColumns="false" CssClass="table table-hover datatable-plugin border-top-0 border-start-0 border-end-0" OnRowDataBound="gdvTickets_RowDataBound" OnRowCommand="gdvTickets_RowCommand">
                                    <Columns>
                                        <asp:BoundField ItemStyle-CssClass="py-4 text-black-50" DataField="tic_description" HeaderText="Descrição" />
                                        <asp:BoundField ItemStyle-CssClass="py-4 text-black-50" DataField="tic_localization" HeaderText="Localização" />
                                        <asp:BoundField ItemStyle-CssClass="py-4 text-black-50" DataField="tic_openTime" HeaderText="Horário de abertura" />
                                        <asp:TemplateField HeaderText="Aceitar" ItemStyle-CssClass="py-4">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lkbPegar" runat="server" CommandArgument='<% #Bind("tic_id") %>'></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card mb-4">
                        <div class="card-header bg-primary text-white">
                            <i class="fa-solid fa-table-list me-1"></i>
                            Notificações recentes
                        </div>
                        <div class="card-body overflow-auto" style="height: 400px">
                            <div class="table-responsive p-3">
                                <asp:Label ID="lblTableNullNotification" runat="server"></asp:Label>
                                <asp:GridView ID="gdvNotification" runat="server" HeaderStyle-CssClass="d-none" AutoGenerateColumns="false" CssClass="table table-borderless table-hover border-start-0 border-end-0"  OnRowDataBound="gdvNotification_RowDataBound">
                                    <Columns>
                                        <asp:BoundField ItemStyle-CssClass="py-4 text-black-50 border-top" DataField="not_status"/>
                                        <asp:BoundField ItemStyle-CssClass="py-4 text-black-50 border-top" DataField="not_title"/>
                                        <asp:BoundField ItemStyle-CssClass="py-4 text-black-50 border-top" DataField="tic_description"/>
                                        <asp:BoundField ItemStyle-CssClass="py-4 text-black-50 border-top" DataField="not_description"/>
                                        <asp:BoundField ItemStyle-CssClass="py-4 text-black-50 border-top" DataField="not_timeMensage"/>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
        <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z" />
        </symbol>
        <symbol id="info-fill" fill="currentColor" viewBox="0 0 16 16">
            <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z" />
        </symbol>
        <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
            <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z" />
        </symbol>
    </svg>
    <script src="../../../js/bootstrap.min.js"></script>
    <script>
        window.onload = (event) => {
            let myAlert = document.querySelector('.toast');
            let bsAlert = new bootstrap.Toast(myAlert);
            bsAlert.show();
        }
    </script>
</asp:Content>

