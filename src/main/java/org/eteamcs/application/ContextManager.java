package org.eteamcs.application;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.xml.XmlBeanDefinitionReader;
import org.springframework.context.support.GenericApplicationContext;
import org.springframework.core.io.ClassPathResource;


/**
 * Classe de contexto do sistema.
 *
 * @author pneves
 */
public final class ContextManager {
    private static Logger logger = Logger.getLogger(ContextManager.class);

    private static GenericApplicationContext beans;

    private ContextManager() { }

    private static void printMemory() {
        Runtime runtime = Runtime.getRuntime();
        //runtime.gc();
        long totalMem = runtime.totalMemory();
        long freeMem = runtime.freeMemory();
        logger.info("\n\nTotal Memory : " + totalMem + " bytes"
                    + "\nFree Memory :" + freeMem + " bytes" + "\nMemory Alloc:"
                    + (totalMem - freeMem) + " bytes");
    }

    /**
     * Imprime informacao do build.
     *
     * @param version versao do codigo
     * @param jobName nome do job em execução
     * @throws Exception Erro genérico
     */
    public static void printBuildInformation(String version, String jobName) throws Exception {
        StringBuffer sb = new StringBuffer();

        String osInfo = System.getProperties().get("os.name") + " ";
        osInfo += System.getProperties().get("os.version") + ",";
        osInfo += System.getProperties().get("os.arch");

        String javaVersion = System.getProperties().get("java.version") + ", ";
        javaVersion += System.getProperties().get("java.vendor");

        String javaVM = System.getProperties().get("java.vm.name") + " ";
        javaVM += System.getProperties().get("java.vm.version") + ", ";
        javaVM += System.getProperties().get("java.vm.vendor") + " ";

        String classPath = System.getProperties().get("java.class.path") + "";
        Runtime runtime = Runtime.getRuntime();
        sb.append("\n\n\n--------------------------------------------------------------------"
                  + "----------------------------");
        sb.append("\nETeamCS - Import From Excell-  Release " + version);
        sb.append("\nJava Version  : " + javaVersion);
        sb.append("\nJava VM       : " + javaVM);
        sb.append("\nOS-System     : " + osInfo);
        sb.append("\nTotal Memory  : " + runtime.totalMemory() + " bytes"
                + "\nFree Memory   : " + runtime.freeMemory() + " bytes");
        sb.append("\nClasspath     : " + classPath);
        sb.append("\n--------------------------------------------------------------------"
                + "----------------------------");
        logger.info(sb.toString());
        System.out.println(sb.toString());
    }


    /**
     * Startup da aplicação.
     *
     * @param appContextXmlFile xml de contexto da aplicacao
     * @param version versao do codigo
     * @param jobName nome do job em execução
     * @throws Exception erro genérico
     */
    public static void startup(String[] appContextXmlFile,
                               String version,
                               String jobName) throws Exception {

        logger.info("Inicio Startup");
        printBuildInformation(version, jobName);
        long time = System.currentTimeMillis();

        //beans = new ClassPathXmlApplicationContext(appContextXmlFile);
        beans = new GenericApplicationContext();
        XmlBeanDefinitionReader xmlReader = new XmlBeanDefinitionReader(beans);

        for (int i=0;i<appContextXmlFile.length;i++) {
        	xmlReader.loadBeanDefinitions(new ClassPathResource(appContextXmlFile[i],
                                        Thread.currentThread().getContextClassLoader()));
        }
        beans.refresh();

        printMemory();
        logger.info("Fim Startup - " + (System.currentTimeMillis() - time) + " ms");
        logger.info("Startup Time(ms):" + (System.currentTimeMillis() - time));
    }

    /**
     * Shutdown da aplicação.
     *
     */
    public static void shutdown() {
        printMemory();
        beans.close();
    }

    public static GenericApplicationContext getContext() {
        return beans;
    }
}
