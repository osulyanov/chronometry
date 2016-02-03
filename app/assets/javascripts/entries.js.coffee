app = angular.module("Chronometry", ["ngResource", "ui.bootstrap", "xeditable"])

app.config ($httpProvider) ->
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken

app.run ["editableOptions", (editableOptions) ->
  editableOptions.theme = "bs3"
  return
]
app.factory "Entry", ["$resource" , ($resource) ->
  $resource("/entries/:id.json", {id: "@id"}, {update: {method: "PUT"}, query:  {method: 'GET', isArray: true}})
]

@EntryCtrl = ["$scope", "$filter", "Entry" ,  ($scope, $filter, Entry) ->
  $scope.entries = Entry.query()

  $scope.addEntry = ->
    entry = Entry.save($scope.newEntry)
    $scope.entries.push(entry)
    $scope.newEntry = {}

  $scope.removeEntry = (entry) ->
    entry.$delete()
    $scope.entries.splice( $scope.entries.indexOf(entry), 1 )

  $scope.checkWorkedMinutes = (data) ->
    if data < 0 || data > 1440
      "Worked minutes is incorrect"

  $scope.saveEntry = (entry) ->
    entry.$update()
]
