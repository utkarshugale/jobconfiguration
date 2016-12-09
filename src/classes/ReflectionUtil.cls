global class ReflectionUtil {
    global static Object getNewInstance(String namespacePrefix,String className) {
        Object retval;
        Type t = Type.forName(namespacePrefix,className);
        
        //If Type is returned as null, argument class may be local class. Try without any namespace
        if (t == null) {
            t = Type.forName(null, className);
        }
        
        if(t == null) {
            throw new ProcessingException(className+' could not be instantiated. Please contact administrator.');
        }
        retVal =  t.newInstance();
        
        return retVal;
    }
}