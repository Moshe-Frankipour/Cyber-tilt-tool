import ClientsTable from "./ClientsTable";
import React from "react";


const data = [
    {
        userID: 1,
        fullName: 'John Doe',
        email: 'john.doe@example.com',
        phone: '1234567890',
        birthdate: '1990-01-01',
        company: "Google",
    },
    {
        userID: 2,
        fullName: 'Jane Smith',
        email: 'jane.smith@example.com',
        phone: '9876543210',
        birthdate: '1985-05-15',
        company: "Google",
    },
    {
        userID: 3,
        fullName: 'Alice Johnson',
        email: 'alice.johnson@example.com',
        phone: '5555555555',
        birthdate: '1992-09-30',
        company: "Google",
    },
    {
        userID: 4,
        fullName: 'Michael Brown',
        email: 'michael.brown@example.com',
        phone: '5551234567',
        birthdate: '1993-07-20',
        company: "Google",
    },
    {
        userID: 5,
        fullName: 'Emily Davis',
        email: 'emily.davis@example.com',
        phone: '9879876543',
        birthdate: '1988-04-10',
        company: "Google",
    },
    {
        userID: 6,
        fullName: 'Daniel Johnson',
        email: 'daniel.johnson@example.com',
        phone: '2223334444',
        birthdate: '1995-12-05',
        company: "Google",
    },
    {
        userID: 7,
        fullName: 'Olivia Anderson',
        email: 'olivia.anderson@example.com',
        phone: '7778889999',
        birthdate: '1991-11-15',
        company: "Google",
    },
    {
        userID: 8,
        fullName: 'William Wilson',
        email: 'william.wilson@example.com',
        phone: '4445556666',
        birthdate: '1987-09-25',
        company: "Google",
    }
];


function SystemUsers() {

    return (
        <div id="reports">
            <h1 id="systemUsersClients">System Users</h1>
            <br/>
            <ClientsTable data={data} isCompany={true}></ClientsTable>
        </div>
    );
}

export default SystemUsers;