package common

import "net/http"

/**************************/
type xhsResponseWriter struct {
	http.ResponseWriter
	StatusCode int
}

func NewXhsResponseWriter(w http.ResponseWriter) *xhsResponseWriter {
	// WriteHeader(int) is not called if our response implicitly returns 200 OK, so
	// we default to that status code.
	return &xhsResponseWriter{w, http.StatusOK}
}

func (lrw *xhsResponseWriter) WriteHeader(code int) {
	lrw.StatusCode = code
	lrw.ResponseWriter.WriteHeader(code)
}
/**************************/
