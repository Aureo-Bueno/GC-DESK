﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Master/MasterPage.master" AutoEventWireup="true" CodeFile="AnalystTickets.aspx.cs" Inherits="Pages_Sistema_Analista_AnalystTickets_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Label ID="lblTitle" runat="server" Text="" />

    <div class="container-fluid">
        <div class="row mt-5">
            <div class="col-md-12">
                <div class="card mb-4">

                    <div class="card-header bg-primary text-white">
                        <i class="fa-solid fa-table me-1"></i>
                        Meus chamados
                    </div>
                    <div class="card-body overflow-auto" style="height: 400px">
                        <div class="table-responsive p-3">
                            <asp:GridView ID="gdvTickets" runat="server" AutoGenerateColumns="false" CssClass="table table-hover datatable-plugin border-top-0 border-start-0 border-end-0" OnRowDataBound="gdvTickets_RowDataBound" OnRowCommand="gdvTickets_RowCommand">
                                <Columns>
                                    <asp:BoundField ItemStyle-CssClass="py-4 text-black-50" DataField="tic_description" HeaderText="Descrição" />
                                    <asp:BoundField ItemStyle-CssClass="py-4 text-black-50" DataField="tic_localization" HeaderText="Localização" />
                                    <asp:BoundField ItemStyle-CssClass="py-4 text-black-50" DataField="tic_openTime" HeaderText="Horário de abertura" />
                                    <asp:BoundField ItemStyle-CssClass="py-4 text-black-50" DataField="tic_status" HeaderText="Status" />
                                    <asp:TemplateField HeaderText="Alterar" ItemStyle-CssClass="py-4">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lkbUpdate" runat="server" CommandArgument='<% #Bind("tic_id") %>'>
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField> 
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="../../../js/bootstrap.min.js"></script>
</asp:Content>

