/**
 * =============================================================================
 * Copyright (C) 2011-12 by ORCID
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 * =============================================================================
 */
package org.orcid.examples.jopmts.mvc;

import java.io.StringWriter;

import javax.xml.namespace.NamespaceContext;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.TransformerFactoryConfigurationError;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathFactory;

import org.apache.commons.lang.StringUtils;
import org.orcid.examples.jopmts.OrcidService;
import org.orcid.examples.jopmts.impl.NamespaceContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.w3c.dom.Document;

/**
 * @author Will Simpson
 */
@Controller
public class OrcidController {
    private OrcidService tier2Service;

    public void setOrcidService(OrcidService orcidService) {
        this.tier2Service = orcidService;
    }

    @RequestMapping("/")
    public String home() {
        return "home";
    }

    @RequestMapping("/qrcode")
    public String orcidQrCode(Model model) throws Exception {
        Document orcidDocument = tier2Service.getOrcidDocument();
        model.addAttribute("full_orcid_profile", documentXml(orcidDocument));

        XPath xpath = createXPath();
        OrcidProfile orcidProfile = new OrcidProfile(orcidDocument, xpath);
        model.mergeAttributes(orcidProfile);

        String vcardName = (String) orcidProfile.get("given_names");
        String familyName = (String) orcidProfile.get("family_name");
        if (StringUtils.isNotBlank(familyName)) {
            vcardName += " " + familyName;
        }
        model.addAttribute("vcard_name", vcardName);

        return "qrcode";
    }

    private String documentXml(Document orcidDocument) throws TransformerFactoryConfigurationError, TransformerConfigurationException, TransformerException {
        TransformerFactory transfac = TransformerFactory.newInstance();
        Transformer trans = transfac.newTransformer();
        trans.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "yes");
        trans.setOutputProperty(OutputKeys.INDENT, "yes");

        StringWriter sw = new StringWriter();
        StreamResult result = new StreamResult(sw);
        DOMSource source = new DOMSource(orcidDocument);
        trans.transform(source, result);
        String xmlString = sw.toString();
        return xmlString;
    }

    private XPath createXPath() {
        XPath xpath = XPathFactory.newInstance().newXPath();
        xpath.setNamespaceContext(createNamespaceContext());
        return xpath;
    }

    private NamespaceContext createNamespaceContext() {
        NamespaceContextImpl namespaceContext = new NamespaceContextImpl();
        namespaceContext.addNamespace("o", "http://www.orcid.org/ns/orcid");
        return namespaceContext;
    }
}
