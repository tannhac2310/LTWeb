package Entity;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2021-12-05T15:45:14")
@StaticMetamodel(Invoice.class)
public class Invoice_ { 

    public static volatile SingularAttribute<Invoice, Double> totalAmount;
    public static volatile SingularAttribute<Invoice, Integer> uid;
    public static volatile SingularAttribute<Invoice, Character> isProccessed;
    public static volatile SingularAttribute<Invoice, Integer> invoiceID;
    public static volatile SingularAttribute<Invoice, Date> invoiceDate;

}