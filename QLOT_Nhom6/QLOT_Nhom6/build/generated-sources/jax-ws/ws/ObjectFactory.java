
package ws;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the ws package. 
 * <p>An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {

    private final static QName _FinishOrderResponse_QNAME = new QName("http://ws/", "finishOrderResponse");
    private final static QName _FinishVisa_QNAME = new QName("http://ws/", "finishVisa");
    private final static QName _FinishVisaResponse_QNAME = new QName("http://ws/", "finishVisaResponse");
    private final static QName _CheckVisa_QNAME = new QName("http://ws/", "checkVisa");
    private final static QName _CheckOrderResponse_QNAME = new QName("http://ws/", "checkOrderResponse");
    private final static QName _CheckOrder_QNAME = new QName("http://ws/", "checkOrder");
    private final static QName _CheckVisaResponse_QNAME = new QName("http://ws/", "checkVisaResponse");
    private final static QName _FinishOrder_QNAME = new QName("http://ws/", "finishOrder");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: ws
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link FinishOrderResponse }
     * 
     */
    public FinishOrderResponse createFinishOrderResponse() {
        return new FinishOrderResponse();
    }

    /**
     * Create an instance of {@link FinishVisa }
     * 
     */
    public FinishVisa createFinishVisa() {
        return new FinishVisa();
    }

    /**
     * Create an instance of {@link FinishVisaResponse }
     * 
     */
    public FinishVisaResponse createFinishVisaResponse() {
        return new FinishVisaResponse();
    }

    /**
     * Create an instance of {@link CheckVisa }
     * 
     */
    public CheckVisa createCheckVisa() {
        return new CheckVisa();
    }

    /**
     * Create an instance of {@link CheckOrderResponse }
     * 
     */
    public CheckOrderResponse createCheckOrderResponse() {
        return new CheckOrderResponse();
    }

    /**
     * Create an instance of {@link CheckOrder }
     * 
     */
    public CheckOrder createCheckOrder() {
        return new CheckOrder();
    }

    /**
     * Create an instance of {@link CheckVisaResponse }
     * 
     */
    public CheckVisaResponse createCheckVisaResponse() {
        return new CheckVisaResponse();
    }

    /**
     * Create an instance of {@link FinishOrder }
     * 
     */
    public FinishOrder createFinishOrder() {
        return new FinishOrder();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link FinishOrderResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws/", name = "finishOrderResponse")
    public JAXBElement<FinishOrderResponse> createFinishOrderResponse(FinishOrderResponse value) {
        return new JAXBElement<FinishOrderResponse>(_FinishOrderResponse_QNAME, FinishOrderResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link FinishVisa }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws/", name = "finishVisa")
    public JAXBElement<FinishVisa> createFinishVisa(FinishVisa value) {
        return new JAXBElement<FinishVisa>(_FinishVisa_QNAME, FinishVisa.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link FinishVisaResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws/", name = "finishVisaResponse")
    public JAXBElement<FinishVisaResponse> createFinishVisaResponse(FinishVisaResponse value) {
        return new JAXBElement<FinishVisaResponse>(_FinishVisaResponse_QNAME, FinishVisaResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link CheckVisa }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws/", name = "checkVisa")
    public JAXBElement<CheckVisa> createCheckVisa(CheckVisa value) {
        return new JAXBElement<CheckVisa>(_CheckVisa_QNAME, CheckVisa.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link CheckOrderResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws/", name = "checkOrderResponse")
    public JAXBElement<CheckOrderResponse> createCheckOrderResponse(CheckOrderResponse value) {
        return new JAXBElement<CheckOrderResponse>(_CheckOrderResponse_QNAME, CheckOrderResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link CheckOrder }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws/", name = "checkOrder")
    public JAXBElement<CheckOrder> createCheckOrder(CheckOrder value) {
        return new JAXBElement<CheckOrder>(_CheckOrder_QNAME, CheckOrder.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link CheckVisaResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws/", name = "checkVisaResponse")
    public JAXBElement<CheckVisaResponse> createCheckVisaResponse(CheckVisaResponse value) {
        return new JAXBElement<CheckVisaResponse>(_CheckVisaResponse_QNAME, CheckVisaResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link FinishOrder }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://ws/", name = "finishOrder")
    public JAXBElement<FinishOrder> createFinishOrder(FinishOrder value) {
        return new JAXBElement<FinishOrder>(_FinishOrder_QNAME, FinishOrder.class, null, value);
    }

}
