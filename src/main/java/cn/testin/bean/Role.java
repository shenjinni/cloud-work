package cn.testin.bean;

public class Role {
    private Long roleId;

    private String roleShortName;

    private String roleName;

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    public String getRoleShortName() {
        return roleShortName;
    }

    public void setRoleShortName(String roleShortName) {
        this.roleShortName = roleShortName == null ? null : roleShortName.trim();
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName == null ? null : roleName.trim();
    }
}