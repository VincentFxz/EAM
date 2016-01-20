<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="description" type="java.lang.String" required="true" description="字典描述"%>
<%@ attribute name="type" type="java.lang.String" required="true" description="字典类型"%>
<%@ attribute name="sort" type="java.lang.String" required="true" description="排序值"%>
<a href="javascript:" onclick="showDlg();">   添加字典</a>
<script type="text/javascript">

    function showDlg(){
        var url="${ctx}/sys/dict/form/dlg?description=${description}&type=${type}&sort=${sort}"
        top.$.jBox("iframe:"+url,{ title:"添加字典${description}",width:500,height:500, buttons:{'关闭': true}, submit:function(v, h, f){
            return true;
        }, loaded:function(h){
            $(".jbox-content", top.document).css("overflow-y","hidden");
        }});
    }
</script>