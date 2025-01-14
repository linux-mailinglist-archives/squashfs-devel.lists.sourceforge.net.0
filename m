Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFE9A1131A
	for <lists+squashfs-devel@lfdr.de>; Tue, 14 Jan 2025 22:32:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1tXoWj-0001HG-PE;
	Tue, 14 Jan 2025 21:32:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <phillip@squashfs.org.uk>) id 1tXoWi-0001HA-RG
 for squashfs-devel@lists.sourceforge.net;
 Tue, 14 Jan 2025 21:32:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5R4FRYTqYMEErU8fLH7O/4J515g2J0Jx5ebHScGRYls=; b=Wwdg7YPZIK/de/hW5O5HCm0Ryj
 1EtBhvqPKwycajJKbbn4s5sjbj85FZVLhS3YIecLVok5/PSumV4wjPZiU4NXxB0jJSE3DLuypYWFB
 PXalHnYWQ81i7vTN1vD1qUA67acvptPb96GDJkPRE1RhZ+3ZbF9NO9hj2Vkzhfe4N9eI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5R4FRYTqYMEErU8fLH7O/4J515g2J0Jx5ebHScGRYls=; b=DXtQude90iBJ0S1t4Nog1lpytu
 8MCBNcUP+wqiaD/7vapM2zAwKc1QTp2q3sp4Lw2a0eyl80l2zumSI2KOYAQGGY256h5zxrQcNVyY9
 xP+GbimbcVpzknMhDnMbSc0eOFKPTqwf+zAbtAevtO3T4nB5408M/8mFIE2E+jf3aD8A=;
Received: from sxb1plsmtpa01-12.prod.sxb1.secureserver.net ([188.121.53.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tXoWi-0008SM-Kn for squashfs-devel@lists.sourceforge.net;
 Tue, 14 Jan 2025 21:32:45 +0000
Received: from [192.168.178.95] ([82.69.79.175]) by :SMTPAUTH: with ESMTPSA
 id XoDvt575dxZ1ZXoDvtRqjh; Tue, 14 Jan 2025 14:13:20 -0700
X-CMAE-Analysis: v=2.4 cv=S8MjwJsP c=1 sm=1 tr=0 ts=6786d370
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=IkcTkHD0fZMA:10 a=7CQSdrXTAAAA:8 a=JfrnYn6hAAAA:8 a=FXvPX3liAAAA:8
 a=aJ2FpNpiM_XpSbliDKwA:9 a=QEXdDO2ut3YA:10 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=UObqyxdv-6Yh2QiB9mM_:22
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
Message-ID: <699b01ba-146d-4669-8521-e8d012c6e28b@squashfs.org.uk>
Date: Tue, 14 Jan 2025 21:12:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20250110163300.3346321-1-willy@infradead.org>
 <20250110163300.3346321-2-willy@infradead.org>
Content-Language: en-US
From: Phillip Lougher <phillip@squashfs.org.uk>
In-Reply-To: <20250110163300.3346321-2-willy@infradead.org>
X-CMAE-Envelope: MS4xfAYAI12+DkpbT++IdQXi7iCcI5QfnZHw6D2tywCbyigO+zt+GIPF8JEdB9b/pAEym8yXd1KG36dSRPEXXPUHJZxKM/meqFXpSZveF7acde7dLTY8fVpU
 f7Kzr+cFcpskAzNAI41bE9eLhW35HtwX4s40zn39Y++DhD4R2Emq2Fgpj/LKTf+F8f/eJMvMb7qua5pXWLi/v6AZ+wMnshfqWmHQ/XMF6JkPIGfGrc8T8Vo/
 urMymLTctcHcc77anzYvIUlBV+AhXpG16uHibnysATDiqM+fmQFg/baIN8vkiNbMiQKV7D8jSL3z1gPXxFoEUPNstrJdpLUqjvEjWihXNVcPwY4ZU9QoebPQ
 7TSoxTLf
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 1/10/25 16:32, Matthew Wilcox (Oracle) wrote: > I got the
 polarity of "uptodate" wrong. Rename it. Thanks to > Ryan for testing; please
 fold into above named patch, and he'd like > you to add > > T [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [188.121.53.131 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [188.121.53.131 listed in bl.score.senderscore.com]
X-Headers-End: 1tXoWi-0008SM-Kn
Subject: Re: [Squashfs-devel] [PATCH 2/2] squashfs: Fix "convert
 squashfs_fill_page() to take a folio"
X-BeenThere: squashfs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <squashfs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=squashfs-devel>
List-Post: <mailto:squashfs-devel@lists.sourceforge.net>
List-Help: <mailto:squashfs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: linux-fsdevel@vger.kernel.org, squashfs-devel@lists.sourceforge.net,
 Ryan Roberts <ryan.roberts@arm.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: squashfs-devel-bounces@lists.sourceforge.net



On 1/10/25 16:32, Matthew Wilcox (Oracle) wrote:
> I got the polarity of "uptodate" wrong.  Rename it.  Thanks to
> Ryan for testing; please fold into above named patch, and he'd like
> you to add
> 
> Tested-by: Ryan Roberts <ryan.roberts@arm.com>
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

Reviewed-by: Phillip Lougher <phillip@squashfs.org.uk>
Tested-by: Phillip Lougher <phillip@squashfs.org.uk>

> ---
>   fs/squashfs/file.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
> index da25d6fa45ce..018f0053a4f5 100644
> --- a/fs/squashfs/file.c
> +++ b/fs/squashfs/file.c
> @@ -400,7 +400,7 @@ void squashfs_copy_cache(struct folio *folio,
>   			bytes -= PAGE_SIZE, offset += PAGE_SIZE) {
>   		struct folio *push_folio;
>   		size_t avail = buffer ? min(bytes, PAGE_SIZE) : 0;
> -		bool uptodate = true;
> +		bool updated = false;
>   
>   		TRACE("bytes %zu, i %d, available_bytes %zu\n", bytes, i, avail);
>   
> @@ -415,9 +415,9 @@ void squashfs_copy_cache(struct folio *folio,
>   		if (folio_test_uptodate(push_folio))
>   			goto skip_folio;
>   
> -		uptodate = squashfs_fill_page(push_folio, buffer, offset, avail);
> +		updated = squashfs_fill_page(push_folio, buffer, offset, avail);
>   skip_folio:
> -		folio_end_read(push_folio, uptodate);
> +		folio_end_read(push_folio, updated);
>   		if (i != folio->index)
>   			folio_put(push_folio);
>   	}


_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
