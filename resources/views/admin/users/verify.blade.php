@extends('layouts.app')

@section('content')
<div class="container py-5">

<div class="card shadow-sm border-0">
    <div class="card-header bg-primary text-white d-flex align-items-center">
        <i class="bi bi-person-check me-2"></i>
        <h5 class="mb-0 fw-bold">
    👤 User Verification
</h5>

    </div>

    <div class="card-body p-0">
    

    {{-- Success message --}}
    @if(session('success'))
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        {{ session('success') }}
        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    </div>
@endif


    {{-- If no pending users --}}
    @if($pendingUsers->isEmpty())
        <div class="text-center py-5 text-muted">
    <h5>🎉 All caught up!</h5>
    <p>No users are waiting for verification.</p>
</div>

    @else
    <div class="bg-white shadow rounded-xl overflow-hidden">
        <table class="table table-hover align-middle mb-0">
    <thead class="table-light">
        <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Role</th>
            <th class="text-center">Status</th>
            <th class="text-center">Action</th>
        </tr>
    </thead>
    <tbody>
    @foreach($pendingUsers as $user)
        <tr>
            <td class="fw-semibold">{{ $user->name }}</td>
            <td>{{ $user->email }}</td>
            <td>
                <span class="badge bg-secondary text-capitalize">
                    {{ $user->role }}
                </span>
            </td>

            <td class="text-center">
                <span class="badge bg-warning text-dark">
                    Pending
                </span>
            </td>

            <td class="text-center">

                {{-- APPROVE --}}
                <form method="POST"
                      action="{{ route('admin.users.approve', $user) }}"
                      class="d-inline">
                    @csrf
                    <button type="submit"
                            class="btn btn-success btn-sm me-1">
                        ✔ Approve
                    </button>
                </form>

                {{-- REJECT --}}
                <form method="POST"
                      action="{{ route('admin.users.reject', $user) }}"
                      class="d-inline"
                      onsubmit="return confirm('Reject this user?')">
                    @csrf
                    @method('DELETE')
                    <button type="submit"
                            class="btn btn-danger btn-sm">
                        ✖ Reject
                    </button>
                </form>

            </td>
        </tr>
    @endforeach
    </tbody>
</table>

    </div>
    @endif
</div>
@endsection
