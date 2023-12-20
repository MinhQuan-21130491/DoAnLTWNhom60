package service;

import dao.DAOInvoice;
import model.Invoice;

import java.sql.Date;
import java.util.ArrayList;

public class InvoiceService {
    static InvoiceService instance;

    private InvoiceService() {
    }

    public static InvoiceService getInstance() {
        if (instance == null)
            instance = new InvoiceService();
        return instance;
    }

    public ArrayList<Invoice> listInvoice() {
        ArrayList<Invoice> list = DAOInvoice.listInvoice();
        for (Invoice i : list) {
            i.setDetails(DAOInvoice.listDetail(i.getIdInvoice()));
        }
        return list;
    }

    public Invoice selectById(int idInvoice) {
        Invoice invoice = DAOInvoice.selectById(idInvoice);
        if (invoice != null) {
            invoice.setDetails(DAOInvoice.listDetail(idInvoice));
        }
        return invoice;
    }

    public int delInvoice(int idInvoice) {
        return DAOInvoice.delInvoice(idInvoice);
    }

    public int updateStatus(int idInvoice, int status) {
        return DAOInvoice.updateStatus(idInvoice, status);
    }
    public ArrayList<Invoice> getListByStatus(int st) {
        ArrayList<Invoice> list = DAOInvoice.getListByStatus(st);
        for (Invoice i : list) {
            i.setDetails(DAOInvoice.listDetail(i.getIdInvoice()));
        }
        return list;
    }
    public ArrayList<Invoice> searchByStartDate(Date d) {
        ArrayList<Invoice> list = DAOInvoice.searchByStartDate(d);
        for (Invoice i : list) {
            i.setDetails(DAOInvoice.listDetail(i.getIdInvoice()));
        }
        return list;
    }

    }

