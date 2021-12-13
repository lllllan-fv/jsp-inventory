package bean;

import java.util.List;

public class RecordData {
    private String invoice_type;
    private String storehouse_in;
    private String storehouse_out;
    private String customer;
    private String supplier;
    private String dealer;
    private String date1;
    private String total;

    private List<Detail> table;

    public RecordData(String invoice_type, String storehouse_in, String storehouse_out, String customer, String supplier, String dealer, String date1, String total, List<Detail> table) {
        this.invoice_type = invoice_type;
        this.storehouse_in = storehouse_in;
        this.storehouse_out = storehouse_out;
        this.customer = customer;
        this.supplier = supplier;
        this.dealer = dealer;
        this.date1 = date1;
        this.total = total;
        this.table = table;
    }

    public String getInvoice_type() {
        return invoice_type;
    }

    public void setInvoice_type(String invoice_type) {
        this.invoice_type = invoice_type;
    }

    public String getStorehouse_in() {
        return storehouse_in;
    }

    public void setStorehouse_in(String storehouse_in) {
        this.storehouse_in = storehouse_in;
    }

    public String getStorehouse_out() {
        return storehouse_out;
    }

    public void setStorehouse_out(String storehouse_out) {
        this.storehouse_out = storehouse_out;
    }

    public String getCustomer() {
        return customer;
    }

    public void setCustomer(String customer) {
        this.customer = customer;
    }

    public String getSupplier() {
        return supplier;
    }

    public void setSupplier(String supplier) {
        this.supplier = supplier;
    }

    public String getDealer() {
        return dealer;
    }

    public void setDealer(String dealer) {
        this.dealer = dealer;
    }

    public String getDate1() {
        return date1;
    }

    public void setDate1(String date1) {
        this.date1 = date1;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    public List<Detail> getTable() {
        return table;
    }

    public void setTable(List<Detail> table) {
        this.table = table;
    }

    @Override
    public String toString() {
        return "RecordData{" +
                "invoice_type='" + invoice_type + '\'' +
                ", storehouse_in='" + storehouse_in + '\'' +
                ", storehouse_out='" + storehouse_out + '\'' +
                ", customer='" + customer + '\'' +
                ", supplier='" + supplier + '\'' +
                ", dealer='" + dealer + '\'' +
                ", date='" + date1 + '\'' +
                ", total='" + total + '\'' +
                ", table=" + table +
                '}';
    }

    public class Detail {
        private String commodity;
        private String price;
        private String quantity;
        private String amount;

        public Detail(String commodity, String price, String quantity, String amount) {
            this.commodity = commodity;
            this.price = price;
            this.quantity = quantity;
            this.amount = amount;
        }

        public String getCommodity() {
            return commodity;
        }

        public void setCommodity(String commodity) {
            this.commodity = commodity;
        }

        public String getPrice() {
            return price;
        }

        public void setPrice(String price) {
            this.price = price;
        }

        public String getQuantity() {
            return quantity;
        }

        public void setQuantity(String quantity) {
            this.quantity = quantity;
        }

        public String getAmount() {
            return amount;
        }

        public void setAmount(String amount) {
            this.amount = amount;
        }

        @Override
        public String toString() {
            return "Detail{" +
                    "commodity='" + commodity + '\'' +
                    ", price='" + price + '\'' +
                    ", quantity='" + quantity + '\'' +
                    ", amount='" + amount + '\'' +
                    '}';
        }
    }
}
