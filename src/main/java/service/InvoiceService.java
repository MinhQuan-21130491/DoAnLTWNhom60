package service;

import dao.DAOInvoice;
import model.Invoice;

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
        ArrayList<Invoice> list = new ArrayList<>();
        for(Invoice i: list) {
            i.setDetails(DAOInvoice.listDetail(i.getIdInvoice()));
        }
        return list;
    }
    public synchronized int delInvoice(int idInvoice) {
        return  DAOInvoice.delInvoice(idInvoice);
    }
    public synchronized int updateStatus(int idInvoice, int status) {
        return  DAOInvoice.updateStatus(idInvoice, status);
    }
    }
