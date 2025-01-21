const base = {
    get() {
        return {
            url : "http://localhost:8080/ssmwhkb8/",
            name: "ssmwhkb8",
            // 退出到首页链接
            indexUrl: ''
        };
    },
    getProjectName(){
        return {
            projectName: "仓库管理信息系统"
        } 
    }
}
export default base
