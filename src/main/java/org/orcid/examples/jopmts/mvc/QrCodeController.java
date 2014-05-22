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

import net.glxn.qrgen.QRCode;
import net.glxn.qrgen.vcard.VCard;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author Will Simpson
 */
@Controller
public class QrCodeController {
    

    @RequestMapping(value = "/qrcode/john_doe.png", method=RequestMethod.GET, produces = MediaType.IMAGE_PNG_VALUE)
    public @ResponseBody byte[] generateJohnDoe() {
        VCard johnDoe = new VCard("John Doe").setEmail("john.doe@example.org").setAddress("John Doe Street 1, 5678 Doestown").setTitle("Mister")
                .setCompany("John Doe Inc.").setPhonenumber("1234").setWebsite("www.example.org");
        return QRCode.from(johnDoe).stream().toByteArray();
    }
    
    @RequestMapping(value = "/qrcode/generate.png", method=RequestMethod.GET, produces = MediaType.IMAGE_PNG_VALUE)
    public @ResponseBody byte[] generate(@RequestParam("website") String website, @RequestParam("name") String name, @RequestParam("email") String email) {
        VCard johnDoe = new VCard(name).setEmail(email).setWebsite(website);
        return QRCode.from(johnDoe).withSize(500, 500).stream().toByteArray();
    }
    
}
