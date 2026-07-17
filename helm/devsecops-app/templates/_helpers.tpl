{{/*
Expand the name of the chart.
*/}}
{{- define "devsecops-app.name" -}}
{{- .Chart.Name -}}
{{- end -}}

{{/*
Create a full name for resources.
*/}}
{{- define "devsecops-app.fullname" -}}
{{- printf "%s" .Chart.Name -}}
{{- end -}}

{{/*
Common labels used by all Kubernetes resources.
*/}}
{{- define "devsecops-app.labels" -}}
app.kubernetes.io/name: {{ include "devsecops-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}