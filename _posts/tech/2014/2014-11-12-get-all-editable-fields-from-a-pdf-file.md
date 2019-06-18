---
layout: post
title: Get all editable fields from a PDF file
categories: [tech]
---
Lots of libraries are capable to read, edit or manipulate PDF files. I have been using iText for filling in an editable form in a PDF file.
This library is pretty simple to use, the following snippet will let you know the names of the fields that are editable in a PDF file.
<!--more-->

{% highlight java %}
File f = new File("D:/myfile.pdf");
PdfReader reader = null;

// Use try-with-resources for streams, PdfReader variable cannot be declared in this statement because it does
// not implement Closeable interface (maybe it will in a future release !)
try (InputStream pdfIn = new FileInputStream(f); ByteArrayOutputStream pdfOut = new ByteArrayOutputStream()) {

    // Read PDF with iText classes
    reader = new PdfReader(pdfIn);
    PdfStamper stamper = new PdfStamper(reader, pdfOut);

    // Get the form from the PDF
    AcroFields form = stamper.getAcroFields();

    // For each field of the form : display its name
    for (Entry<String, Item>> entry : form.getFields().entrySet()) {
        System.out.println(entry.getKey());
    }

} catch (IOException e) { 
    e.printStackTrace();
} catch (DocumentException e) {
    e.printStackTrace();
} finally {
    // Do not forget to close the PdfStamper otherwise your ByteArrayOutputStream will be empty !
    stamper.close();
    reader.close();
}
{% endhighlight %}

Put this snippet in a main and you can test it ! I used iText 5.5.3 in this example.

You can display other information about each form (see Java classes Item and AcroFields), for example you can display the type of each field : input text, checkbox, radio button, etc.
