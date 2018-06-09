var MSXML2_DOMDocument_6 = "MSXML2.DOMDocument.6.0";

function tranform(xml, xsl) {
    if (window.ActiveXObject || "ActiveXObject" in window) {
        var xmlSerializer = new XMLSerializer();
        var xmlString = xmlSerializer.serializeToString(xml);
        var xslString = xmlSerializer.serializeToString(xsl);

        var xsl = new ActiveXObject(MSXML2_DOMDocument_6);
        xsl.setProperty("AllowXsltScript", true);
        xsl.setProperty("AllowDocumentFunction", true);
        xsl.resolveExternals = true;
        xsl.async = false;
        xsl.loadXML(xslString);

        var xml = new ActiveXObject(MSXML2_DOMDocument_6);
        xml.resolveExternals = true;
        xml.preserveWhiteSpace = true;
        xml.async = false;
        xml.loadXML(xmlString);
        xml.resolveExternals = true;

        ex = xml.transformNode(xsl);
        document.getElementById("example").innerHTML = ex;
    } else if (document.implementation && document.implementation.createDocument) {
        xsltProcessor = new XSLTProcessor();
        xsltProcessor.importStylesheet(xsl);
        resultDocument = xsltProcessor.transformToFragment(xml, document);
        document.getElementById("example").appendChild(resultDocument);
    }
}

function loadXMLDoc() {
    $.ajax({
        method: "GET",
        url: "data.xml",
        dataType: "xml"
    }).then(function (xml) {
            $.ajax({
                method: "GET",
                url: "render.xslt",
                dataType: "xml"
            }).then(function (xsl) {
                    tranform(xml, xsl)
                },
                function (e) {
                    console.log("Got error in xml", e.status)
                })
        },
        function (e) {
            console.log("Got error in xml", e.status)
        })
}

$(loadXMLDoc)