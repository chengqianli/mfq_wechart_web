<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--<%@ include file="/WEB-INF/common/resource_jstl.jsp" %>--%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>美分期后台管理系统</title>
    <%-- resource css --%>
    <%@ include file="/WEB-INF/common/resource_css.jsp" %>
    <style type="text/css">
        .col-sm-7 {
            margin: 2% 0;
        }

        a:hover {
            text-decoration: underline;
        }

        #datatable_length {
            width: 100%;
        }

        #datatable_length {
            float: right;
        }

        .menu_section {
            margin-bottom: 0;
        }
    </style>
</head>

<body class="nav-md">
<%-- menu profile --%>
<%@ include file="/WEB-INF/common/menu_profile.jsp" %>
<%-- sidebar menu --%>
<%@ include file="/WEB-INF/common/sidebar_menu.jsp" %>
<%-- sidebar footer --%>
<%@ include file="/WEB-INF/common/sidebar_footer.jsp" %>
<%-- top navigation --%>
<%@ include file="/WEB-INF/common/top_nav.jsp" %>
<!-- page content -->
<div class="right_col" role="main">
    <div class="">
        <div class="page-title">
            <div class="row title_left">
                <div class="span6">
                    <ul class="breadcrumb">
                        <li>
                            <a href="#">放款机构管理</a> <span class="divider"></span>
                        </li>
                        <li>
                            <a href="#">放款机构列表</a> <span class="divider"></span>
                        </li>
                        <li>
                            <a href="#">保存合同</a> <span class="divider"></span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="clearfix"></div>

        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".add_cooperation"
                                style="float: right;"><a href="#" onclick="save()" style="color: #FFFFFF;">保存合同</a>
                        </button>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">


                        <div class="col-md-9 col-sm-9 col-xs-12">
                            <div class="x_panel">
                                <div class="x_title" style="border: 0;">
                                    <h2>合同内容：</h2>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <div id="alerts"></div>
                                    <div class="btn-toolbar editor" data-role="editor-toolbar"
                                         data-target="#editor-one">
                                        <div class="btn-group">
                                            <a class="btn dropdown-toggle" data-toggle="dropdown" title="Font"><i
                                                    class="fa fa-font"></i><b class="caret"></b></a>
                                            <ul class="dropdown-menu">
                                            </ul>
                                        </div>

                                        <div class="btn-group">
                                            <a class="btn dropdown-toggle" data-toggle="dropdown" title="Font Size"><i
                                                    class="fa fa-text-height"></i>&nbsp;<b class="caret"></b></a>
                                            <ul class="dropdown-menu">
                                                <li>
                                                    <a data-edit="fontSize 5">
                                                        <p style="font-size:17px">Huge</p>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a data-edit="fontSize 3">
                                                        <p style="font-size:14px">Normal</p>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a data-edit="fontSize 1">
                                                        <p style="font-size:11px">Small</p>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>

                                        <div class="btn-group">
                                            <a class="btn" data-edit="bold" title="Bold (Ctrl/Cmd+B)"><i
                                                    class="fa fa-bold"></i></a>
                                            <a class="btn" data-edit="italic" title="Italic (Ctrl/Cmd+I)"><i
                                                    class="fa fa-italic"></i></a>
                                            <a class="btn" data-edit="strikethrough" title="Strikethrough"><i
                                                    class="fa fa-strikethrough"></i></a>
                                            <a class="btn" data-edit="underline" title="Underline (Ctrl/Cmd+U)"><i
                                                    class="fa fa-underline"></i></a>
                                        </div>

                                        <div class="btn-group">
                                            <a class="btn" data-edit="insertunorderedlist" title="Bullet list"><i
                                                    class="fa fa-list-ul"></i></a>
                                            <a class="btn" data-edit="insertorderedlist" title="Number list"><i
                                                    class="fa fa-list-ol"></i></a>
                                            <a class="btn" data-edit="outdent" title="Reduce indent (Shift+Tab)"><i
                                                    class="fa fa-dedent"></i></a>
                                            <a class="btn" data-edit="indent" title="Indent (Tab)"><i
                                                    class="fa fa-indent"></i></a>
                                        </div>

                                        <div class="btn-group">
                                            <a class="btn" data-edit="justifyleft" title="Align Left (Ctrl/Cmd+L)"><i
                                                    class="fa fa-align-left"></i></a>
                                            <a class="btn" data-edit="justifycenter" title="Center (Ctrl/Cmd+E)"><i
                                                    class="fa fa-align-center"></i></a>
                                            <a class="btn" data-edit="justifyright" title="Align Right (Ctrl/Cmd+R)"><i
                                                    class="fa fa-align-right"></i></a>
                                            <a class="btn" data-edit="justifyfull" title="Justify (Ctrl/Cmd+J)"><i
                                                    class="fa fa-align-justify"></i></a>
                                        </div>

                                        <div class="btn-group">
                                            <a class="btn dropdown-toggle" data-toggle="dropdown" title="Hyperlink"><i
                                                    class="fa fa-link"></i></a>
                                            <div class="dropdown-menu input-append">
                                                <input class="span2" placeholder="URL" type="text"
                                                       data-edit="createLink"/>
                                                <button class="btn" type="button">Add</button>
                                            </div>
                                            <a class="btn" data-edit="unlink" title="Remove Hyperlink"><i
                                                    class="fa fa-cut"></i></a>
                                        </div>

                                        <div class="btn-group">
                                            <a class="btn" title="Insert picture (or just drag & drop)" id="pictureBtn"><i
                                                    class="fa fa-picture-o"></i></a>
                                            <input type="file" data-role="magic-overlay" data-target="#pictureBtn"
                                                   data-edit="insertImage"/>
                                        </div>

                                        <div class="btn-group">
                                            <a class="btn" data-edit="undo" title="Undo (Ctrl/Cmd+Z)"><i
                                                    class="fa fa-undo"></i></a>
                                            <a class="btn" data-edit="redo" title="Redo (Ctrl/Cmd+Y)"><i
                                                    class="fa fa-repeat"></i></a>
                                        </div>
                                    </div>

                                    <div id="editor-one" class="editor-wrapper">${viewContract}</div>
                                    <input type="hidden" name="orgNo" value="${orgNo}" id="id"/>
                                    <textarea name="content" id="descr" style="display:none;"></textarea>


                                </div>
                            </div>
                        </div>


                        <div class="col-md-3 col-sm-3 col-xs-12">
                            <div class="x_panel" style="padding: 10px 9px; ">
                                <div class="x_title" style="border: 0;">
                                    <h2>合同参数</h2>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content">
                                    <li value="">合同编号：<span>$</span>{contract_id}</li>
                                    <li>真实姓名：<span>$</span>{realName}</li>
                                    <li>项目名称：<span>$</span>{serverName}</li>
                                    <li>项目总额：<span>$</span>{orderSum}</li>
                                    <li>项目优惠后总额：<span>$</span>{discountSum}</li>
                                    <li>分期服务费：<span>$</span>{userServiceSum}</li>
                                    <li>承担类型：<span>$</span>{bearType}</li>
                                    <li>借贷总金额：<span>$</span>{nowSum}</li>
                                    <li>大写总金额：<span>$</span>{nowSumCapital}</li>
                                    <li>借款期限：<span>$</span>{stageName}</li>
                                    <li>自第几月开始还款：<span>$</span>{typeMonthShow}</li>
                                    <li>首次还款日：<span>$</span>{startDate}</li>
                                    <li>借款到期日：<span>$</span>{endDate}</li>
                                    <li>月还款本息金额:<span>$</span>{fqTotalSum}</li>
                                    <li>月还款日：<span>$</span>{dayNow}</li>
                                    <li>银行卡号：<span>$</span>{cardNumber}</li>
                                    <li>开户银行：<span>$</span>{bankName}</li>
                                    <li>支行名称：<span>$</span>{subBankName}</li>
                                    <li>性别：<span>$</span>{sex}</li>
                                    <li>身份证号：<span>$</span>{idNumber}</li>
                                    <li>手机号：<span>$</span>{mobileNumber}</li>
                                    <li>家庭住址：<span>$</span>{homeAddress}</li>
                                    <li>紧急联系人姓名：<span>$</span>{relativesName}</li>
                                    <li>紧急联系人电话：<span>$</span>{relativesPhoneNumber}</li>
                                    <li>朋友姓名：<span>$</span>{friendName}</li>
                                    <li>朋友电话：<span>$</span>{friendPhoneNumber}</li>
                                    <li>同事姓名：<span>$</span>{colleagueName}</li>
                                    <li>同事电话：<span>$</span>{colleaguePhoneNumber}</li>
                                    <li>单位名称：<span>$</span>{companyName}</li>
                                    <li>单位电话：<span>$</span>{compPhone}</li>
                                    <li>单位地址：<span>$</span>{officeAddress}</li>
                                    <li>医院名称：<span>$</span>{hospitalName}</li>
                                    <li>医院银行账号：<span>$</span>{operCardNumber}</li>
                                    <li>医院开户银行：<span>$</span>{operBankName}</li>
                                    <li>医院开户支行<span>$</span>{operSubBankName}</li>
                                    <li>签订日期<span>$</span>{nowDay}</li>
                                    <li>消费授权书编号<span>$</span>{contract_id_dk}</li>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /page content -->
<%-- resource js --%>
<%@ include file="/WEB-INF/common/resource_js.jsp" %>
<%@ include file="/WEB-INF/common/footer.jsp" %>
<script>
    function save() {
        var html = $("#editor-one").html();
        var id = $("#id").val();
        if (html == null || html == '' || id == null || id == '') {
            $.confirm({
                title: '系统提示',
                text: "参数错误",
                confirmButton: '确认',
                cancelButton: false,
            });
            return;
        }

        var formData = new FormData();
        formData.append('orgNo', id);
        formData.append('contractTemplate', html);
        $.ajax({
            url: '${pageContext.request.contextPath}/mfq/lend/edit.do',
            type: 'POST',
            cache: false,
            data: formData,
            processData: false,
            contentType: false
        }).done(function (res) {
            var data = jQuery.parseJSON(res);
            if (data.code == '1') {
                $.confirm({
                    title: '系统提示',
                    text: "保存成功",
                    confirmButton: '确认',
                    cancelButton: false,
                });
//                    history.go(-1);
                var url = '${pageContext.request.contextPath}/mfq/lend/viewContract.do?orgNo=${orgNo}&type=1'
                window.location.href = url;
            } else {
                $.confirm({
                    title: '系统提示',
                    text: "保存失败",
                    confirmButton: '确认',
                    cancelButton: false,
                });
            }
        }).fail(function (res) {
            console.log(res);
        });
    }
</script>
</body>
</html>