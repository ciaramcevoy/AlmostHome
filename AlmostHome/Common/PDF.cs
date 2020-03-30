using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.tool.xml;
using iTextSharp.tool.xml.html;
using iTextSharp.tool.xml.parser;
using iTextSharp.tool.xml.pipeline.css;
using iTextSharp.tool.xml.pipeline.end;
using iTextSharp.tool.xml.pipeline.html;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;

namespace AlmostHome.Common
{
    public class PDF
    {
        public static byte[] CreatePDF(string htmlContent, string cssPath)
        {

            using (MemoryStream stream = new System.IO.MemoryStream())
            {
                Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 100f, 0f);
                PdfWriter writer = PdfWriter.GetInstance(pdfDoc, stream);
                pdfDoc.Open();

                HtmlPipelineContext htmlContext = new HtmlPipelineContext(null);
                htmlContext.SetTagFactory(Tags.GetHtmlTagProcessorFactory());
                ICSSResolver cssResolver = XMLWorkerHelper.GetInstance().GetDefaultCssResolver(false);
                cssResolver.AddCssFile(cssPath, true);

                IPipeline pipeline = new CssResolverPipeline(cssResolver, new HtmlPipeline(htmlContext, new PdfWriterPipeline(pdfDoc, writer)));

                XMLWorker worker = new XMLWorker(pipeline, true);
                XMLParser parser = new XMLParser(worker);
                parser.Parse(new MemoryStream(Encoding.UTF8.GetBytes(htmlContent)));
                pdfDoc.Close();
                return stream.GetBuffer();
            }
        }
    }
}