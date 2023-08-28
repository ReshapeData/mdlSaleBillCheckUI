#' 按纽生成生成器界面
#'
#' @param colTitles  主页标题
#' @param widthRates 左右比例
#' @param func_left 左函数
#' @param func_right 右函数
#' @param tabTitle 标题
#' @param func_bottom  下面一栏
#'
#' @return 返回值
#' @import tsui
#' @export
#'
#' @examples
#' stockTableUI()
stockTableUI <- function(tabTitle ='查看即时库存更新报表',
                     colTitles =c('操作区域','操作区域','显示区域'),
                     widthRates =c(6,6,12),
                     func_left = stockTableUI_left,
                     func_right =stockTableUI_right,
                     func_bottom = stockTableUI_bottom
) {
  
  #三栏式设置，可以复制
  res = tsui::uiGen3(tabTitle = tabTitle,colTitles =colTitles,widthRates = widthRates,func_left = func_left,func_right = func_right,func_bottom = func_bottom )
  return(res)
  
}





#' 请输入文件
#'
#' @return 返回值
#' @export
#'
#' @examples
#' stockTableUI_left()
stockTableUI_left <- function() {
  
  
  res <- tagList(
    tsui::layout_2C(x = tsui::mdl_text(id = 'txt_FMaterialId',label = '请输入物料编码',value = '01.3889U.904'),
                    y=tsui::mdl_text(id = 'txt_companyName',label = '请输入组织名称',value = '江苏嘉好热熔胶股份有限公司')
                    ),
    tsui::layout_2C(x = tsui::mdl_text(id = 'txt_Flot',label = '请输入批号',value = 'R-230809013-A03B-5202U-AD(1-)(印尼)'),
                    y=tsui::mdl_text(id = 'txt_FBillNO',label = '请输入单据编号','SCDD-100-20230807-0002')
    ),
    tsui::layout_2C(x = tsui::mdl_text(id = 'txt_Fsalesman',label = '请输入销售员','谢纪伟'),
                    tsui::mdl_text(id = 'txt_FCustName',label = '请输入客户名称','PT.ANEKA MITRA GEMILANG')
    ),
    
    
  )
  return(res)
  
}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' stockTableUI_bottom()
stockTableUI_right <- function() {
  res <- tagList(
    shinyWidgets::actionBttn(inputId = 'dl_stockTable_query',label = '查看即时库存更新报表')
    
    
  )
  return(res)
  
}


#' 生成区域
#'
#' @return 返回值
#' @export
#'
#' @examples
#' stockTableUI_bottom()
stockTableUI_bottom <- function() {
  res <- tagList(
    tsui::uiScrollX(tsui::mdl_dataTable(id = 'dt_stockTable_dataView',label = '结果显示'))
  )
  return(res)
  
}
