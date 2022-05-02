//
//  EmployeeViewController.swift
//  Demo_ProjectTests
//
//  Created by Tradesocio on 26/04/22.
//

import XCTest
@testable import Demo_Project
class EmployeeViewTest: XCTestCase {
    
    var employeeVc: EmployeeViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Employee", bundle: nil)
        self.employeeVc = storyboard.instantiateViewController(withIdentifier: "EmployeeViewController") as? EmployeeViewController
        
        self.employeeVc.loadView()
        self.employeeVc.viewDidLoad()
    }
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testHasATableView() {
        XCTAssertNotNil(employeeVc.tblViewEmp)
    }
    
    func testTableViewHasDelegate() {
        XCTAssertNotNil(employeeVc.tblViewEmp.delegate)
    }
    
    func testTableViewHasDataSource() {
        XCTAssertNotNil(employeeVc.tblViewEmp.dataSource)
    }
    
    func testemployeeData() {
        XCTAssertNotNil(employeeVc.viewModel.employees.value.count)
    }
    
    func testNoofrows() {
        
        let rowsCount = employeeVc.viewModel.employees.value.count
        let numberOfRows = employeeVc.tblViewEmp.numberOfRows(inSection: 0)
        XCTAssertEqual(rowsCount, numberOfRows)
    }
    
    func testNoofsecction() {
        let numberOfSections = employeeVc.tblViewEmp.numberOfSections
        XCTAssertEqual(1, numberOfSections)
    }
    
    func testTableViewCellHasReuseIdentifier() {
        let cell = employeeVc.tableView(employeeVc.tblViewEmp, cellForRowAt: IndexPath(row: 0, section: 0))
        let actualReuseIdentifer = cell.reuseIdentifier
        let expectedReuseIdentifier = "EmployeeCell"
        XCTAssertEqual(actualReuseIdentifer, expectedReuseIdentifier)
    }
    
    func testTableCellHasCorrectLabelText() {
        let cell0 = employeeVc.tableView(employeeVc.tblViewEmp, cellForRowAt: IndexPath(row: 0, section: 0)) as! EmployeeCell
        // XCTAssertEqual(cell0.lblName.text, "Niranjan Kaul")
        //  XCTAssertEqual(cell0.lblEmail.text, "gopi_johor@langworth.biz")
        // XCTAssertEqual(cell0.lblGender.text, "male")
        // XCTAssertEqual(cell0.lblStatus.text, "active")
        
        
    }
    
    func testGetFirstRow() {
            let tableView = employeeVc.tblViewEmp
            // Reload data
            tableView?.reloadData()
            let indexPath0 = IndexPath(item: 0, section: 0)
            let cell0 = tableView!.cellForRow(at: indexPath0)
            let visibleRows = tableView?.indexPathsForVisibleRows
            XCTAssert(visibleRows != nil)
            XCTAssertTrue(((tableView?.indexPathsForVisibleRows!.contains(indexPath0)) != nil))
            XCTAssert(cell0 != nil)
        }
    
    func testGetFirstRowDataSource() {
        let tableView = employeeVc.tblViewEmp
        tableView?.reloadData()
        let indexPath0 = IndexPath(item: 0, section: 0)
        
        // This won't check for cell visibility.
        _ = employeeVc.tableView(tableView!, cellForRowAt: indexPath0)
        
        let visibleRows = tableView?.indexPathsForVisibleRows
        XCTAssert(visibleRows != nil)           // PASSED
        XCTAssert(((tableView?.indexPathsForVisibleRows!.contains(indexPath0)) != nil))     // PASSED
    }
    
    
}
