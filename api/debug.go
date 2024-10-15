package api

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

func (server *Server) testDebug(ctx *gin.Context) {
	// newUserResponse = userResponse {
	// 	Username      :    "username",
	// 	FullName      :    "full_name",
	// 	Email         :    "email",
	// 	PasswordChangedAt :"password_changed_at",
	// 	CreatedAt         :"created_at",
	// }

	// rsp := loginUserResponse{
	// 	AccessToken: "accessToken",
	// 	User:        newUserResponse,
	// }

	rsp := "test"

	ctx.JSON(http.StatusOK, rsp)
}
