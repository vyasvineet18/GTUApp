/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

angular.module('paginationModule', []).
        directive('pagination', function($timeout) {
            return {
                restrict: 'A',
                replace: 'true',
                templateUrl: '/app/jsp/webportal/templates/pagination-tpl.html',
                scope: {
                    onNavigate: '&',
                    paginationObject: "="
                },
                link: function(scope) {
                    console.log('totalRecords: ' + scope.paginationObject.totalRecords);
                    scope.paginationObject.lastPage = Math.ceil(scope.paginationObject.totalRecords / scope.paginationObject.limit);
                    if (scope.paginationObject.lastPage === 0) {
                        scope.paginationObject.lastPage = 1;
                    }
                    scope.$watch("paginationObject.limit", function(newValue, oldValue) {
                        //This gets called when data changes.
                        scope.paginationObject.lastPage = Math.ceil(scope.paginationObject.totalRecords / scope.paginationObject.limit);
                        if (scope.paginationObject.lastPage === 0) {
                            scope.paginationObject.lastPage = 1;
                        }
                    });
                    scope.$watch("paginationObject.totalRecords", function(newValue, oldValue) {
                        //This gets called when data changes.
                        scope.paginationObject.lastPage = Math.ceil(scope.paginationObject.totalRecords / scope.paginationObject.limit);
                        if (scope.paginationObject.lastPage === 0) {
                            scope.paginationObject.lastPage = 1;
                        }
                    });
                    scope.navigate = function(action) {
                        if (action === 'next') {
                            scope.paginationObject.start = scope.paginationObject.start + scope.paginationObject.limit;
                            scope.paginationObject.currentPage += 1;
                        } else if (action === 'previous') {
                            scope.paginationObject.start = scope.paginationObject.start - scope.paginationObject.limit;
                            scope.paginationObject.currentPage -= 1;
                        }
                        $timeout(function() {
                            scope.onNavigate();
                        }, 100);
                    };
                }
            };
        });
